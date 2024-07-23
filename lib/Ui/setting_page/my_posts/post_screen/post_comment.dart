import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_event.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/comment.dart';
import 'package:taknikat/core/base_widget/dialogcustom.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/post_model/post_model.dart';
import 'package:taknikat/model/product_model/comment_model.dart';

import 'bloc/post_screen_bloc.dart';
import 'bloc/post_screen_event.dart';
import 'bloc/post_screen_state.dart';

class PostComments extends StatefulWidget {
  final PostModel postData;
  final VoidCallback? onCommentSuccess;

  PostComments({required this.postData, Key? key, this.onCommentSuccess})
      : super(key: key);

  @override
  State<PostComments> createState() => _PostCommentsState();
}

class _PostCommentsState extends State<PostComments> {
  final _bloc = sl<PostScreenBloc>();
  final pagingController = PagingController<int, CommentModel>(firstPageKey: 1);
  var _commentController = TextEditingController();

  CommentModel? _commentBeingRepliedTo; // To keep track of the comment being replied to

  @override
  void initState() {
    super.initState();

    pagingController.addPageRequestListener((pageKey) {
      if (pageKey == 1) {
        _bloc.add(GetComments((b) => b..model_id = widget.postData.id));
      } else {
        _bloc.add(GetNextComments((b) => b..model_id = widget.postData.id));
      }
    });
  }

  @override
  void dispose() {
    pagingController.dispose();
    _commentController.dispose();
    super.dispose();
  }
  bool onEditComment=false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostScreenBloc, PostScreenState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.paginator.currentPage == pagingController.nextPageKey) {
          if (state.paginator.isLastPage) {
            pagingController.appendLastPage(
              state.comments
                  .sublist(pagingController.itemList?.length ?? 0)
                  .toList(),
            );
          } else {
            pagingController.appendPage(
              state.comments
                  .sublist(pagingController.itemList?.length ?? 0)
                  .toList(),
              state.paginator.currentPage! + 1,
            );
          }
        }
        if (state.comments.length > 0 &&
            state.comments.length != pagingController.itemList?.length) {
          pagingController.itemList = state.comments.toList();
          pagingController.nextPageKey = state.paginator.currentPage! + 1;
        }

        if (state.success) {
          sl<PostsBloc>().add(InitMyPosts());
          widget.onCommentSuccess?.call();
        }
      },
      builder: (BuildContext context, PostScreenState state) {
        showToast(state.error);
        return Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/like.svg",
                  color: primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '${widget.postData.likes}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      PagedListView<int, CommentModel>(
                        pagingController: pagingController,
                        reverse: true,
                        builderDelegate: PagedChildBuilderDelegate(
                          itemBuilder: (context, item, index) {
                            return CommentWidget(
                              item,
                              onEdit: (comment){
                                setState(() {
                                  onEditComment =true;
                                  _commentBeingRepliedTo = comment;
                                  _commentController.text = comment.reviewContent??''; // Clear text field for new reply
                                });
                                return Future.value(true);
                              },
                              repliedUserId: null,
                              onReply: ([comment, repliedUserId]) {
                                _bloc.add(AddComment(
                                      (b) => b
                                    ..comment = comment
                                    ..repliedUserId = repliedUserId
                                    ..parentCommentId = item.id
                                    ..id = widget.postData.id,
                                ));
                              },
                              onReplyTap: (comment)async {
                                setState(() {
                                  onEditComment =false;
                                  _commentBeingRepliedTo =comment;
                                  _commentController.text = ''; // Clear text field for new reply
                                });
                              },
                            );
                          },
                          firstPageProgressIndicatorBuilder: (context) {
                            return SizedBox.shrink();
                          },
                          newPageProgressIndicatorBuilder: (context) {
                            return SizedBox.shrink();
                          },
                          noItemsFoundIndicatorBuilder: (context) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/comment.svg",
                                  width: 120,
                                  height: 120,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'لا يوجد تعليقات',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      if (state.isLoading)
                        Center(
                          child: loader(context: context),
                        ),
                    ],
                  ),
                ),
                Divider(),
                if (_commentBeingRepliedTo != null) // Show the user who is being replied to
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            onEditComment==true?
                            '${AppLocalizations.of(context).translate("edit")}':
                            '${AppLocalizations.of(context).translate("replying")} ${_commentBeingRepliedTo?.user?.firstName??''} ${_commentBeingRepliedTo?.user?.lastName??''}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.grey),
                          onPressed: () {
                            setState(() {
                              _commentBeingRepliedTo = null;
                              _commentController.text='';
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          fillColor: Color(0xFFF1F2F6),
                          filled: true,
                          hintText: AppLocalizations.of(context)
                              .translate("Add your comment here."),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 13, vertical: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(13.0)),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (appAuthState) {
                          if (_commentController.text.trim().isEmpty) {
                            showToast(AppLocalizations.of(context)
                                .translate("Comment text required"));
                          } else {
                            if(state.isLoading!=true){
                              print('object${onEditComment}');
                              if(onEditComment==true){
                                _bloc.add(UpdateComment((b) => b
                                  ..postId = widget.postData.id
                                  ..id = _commentBeingRepliedTo!.id
                                  ..content = _commentController.text
                                ));
                                _commentController.text = '';
                                setState(() {
                                  _commentBeingRepliedTo = null;
                                  onEditComment=false;
                                });
                              }
                              else{
                                _bloc.add(AddComment((b) => b
                                  ..comment = _commentController.text
                                  ..id = widget.postData.id
                                  ..repliedUserId = _commentBeingRepliedTo?.user?.id
                                  ..parentCommentId = _commentBeingRepliedTo?.id));
                                _commentController.text = '';
                                setState(() {
                                  _commentBeingRepliedTo = null;
                                });
                              }
                            }else{
                              showToast(AppLocalizations.of(context)
                                  .translate("wait"));
                            }
                         }
                        } else {
                          showLogin(context);
                        }
                      },
                      icon: Icon(
                        Icons.send,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
