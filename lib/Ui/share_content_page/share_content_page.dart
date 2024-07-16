import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taknikat/Ui/share_content_page/response_share_widget.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/comment.dart';
import 'package:taknikat/core/base_widget/dialogcustom.dart';
import 'package:taknikat/core/base_widget/share_content_card.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/product_model/comment_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';

import '../../injectoin.dart';
import 'bloc/share_bloc.dart';

class ShareContentPage extends StatefulWidget {
  ShareContentPage({
    Key? key,
    required this.share,
    required this.event,
  }) : super(key: key);
  final ShareModel share;
  final EventModel event;

  @override
  State<ShareContentPage> createState() => _ShareContentPageState();
}

class _ShareContentPageState extends State<ShareContentPage> {
  final _commentController = TextEditingController();

  CommentModel? _commentBeingRepliedTo;

  @override
  Widget build(BuildContext context) {
    final colorSc = Theme.of(context).colorScheme;
    final primaryColor = colorSc.primary;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: baseText(widget.event.name!, color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => sl<ShareBloc>()..shareId = widget.share.id,
        child: Builder(
          builder: (context) {
            final bloc = context.read<ShareBloc>();
            return Column(
              children: [
                // ClipPath(
                //   clipper: CustomClipPath(),
                //   child: Container(
                //     color: primaryColor,
                //     child: Column(
                //       children: [
                //         Container(height: 20),
                //       ],
                //     ),
                //   ),
                // ),

                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      bloc.pagingController.refresh();
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                            delegate: SliverChildListDelegate([
                          if (widget.share.status == ShareStatus.pending &&
                              (widget.event.creator?.isMe ?? false))
                            ResponseToShareWidget(
                              share: widget.share,
                            ),

                          ShareContentCard(
                            share: widget.share,
                            event: widget.event,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(16),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Builder(
                          //         builder: (context) {
                          //           final bloc = context.watch<ShareBloc>();
                          //           final length =
                          //               bloc.pagingController.itemList?.length;
                          //           if (length == null) {
                          //             return Container();
                          //           }
                          //           return Row(
                          //             children: [
                          //               Icon(
                          //                 Icons.comment_outlined,
                          //                 color: primaryColor,
                          //               ),
                          //               SizedBox(
                          //                 width: sizeAware.width * 0.02,
                          //               ),
                          //               Text(
                          //                 length.toString(),
                          //                 style: TextStyle(color: primaryColor),
                          //               ),
                          //             ],
                          //           );
                          //         },
                          //       ),
                          //       ShareWidget(path: 'events/shares/${share.id}'),
                          //     ],
                          //   ),
                          // ),
                          if (widget.share.status == ShareStatus.approved)
                            Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.all(13),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .translate("add a comment"),
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 13,
                                    ),
                                    child: TextField(
                                      onChanged: (value) {
                                        //Do something with the user input.
                                      },
                                      controller: _commentController,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      minLines: 5,
                                      maxLines: 15,
                                      decoration: InputDecoration(
                                        suffix: IconButton(
                                          icon: Icon(
                                            Icons.send_outlined,
                                            color: primaryColor,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            if (appAuthState) {
                                              if (_commentController.text
                                                  .trim()
                                                  .isEmpty) {
                                                showToast(AppLocalizations.of(
                                                        context)
                                                    .translate(
                                                        "Comment text required"));
                                              } else {
                                                bloc.add(CommentAdded(
                                                  comment:
                                                      _commentController.text,
                                                  id: widget.share.id,
                                                ));
                                                _commentController.text = "";
                                              }
                                            } else
                                              showLogin(context);
                                          },
                                        ),
                                        fillColor: Color(0xFFF1F2F6),
                                        filled: true,
                                        hintText: ' اضافة تعليق',
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(13.0)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,

                                          // borderSide: BorderSide(
                                          //     color:
                                          //         Theme.of(context).accentColor,
                                          //     width: 1.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(13.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 13),
                                  Container(
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(
                                        top: 13, right: 13, left: 13),
                                    child: Text(
                                      ' التعليقات',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     if (appAuthState) {
                                  //       if (_commentController.text
                                  //           .trim()
                                  //           .isEmpty) {
                                  //         showToast(AppLocalizations.of(context)
                                  //             .translate(
                                  //                 "Comment text required"));
                                  //       } else {
                                  //         bloc.add(CommentAdded(
                                  //           comment: _commentController.text,
                                  //           id: share.id,
                                  //         ));
                                  //         _commentController.text = "";
                                  //       }
                                  //     } else
                                  //       showLogin(context);
                                  //   },
                                  //   child: Container(
                                  //     margin: EdgeInsets.symmetric(
                                  //       vertical: 13,
                                  //     ),
                                  //     padding: EdgeInsets.symmetric(
                                  //       vertical: 13,
                                  //       horizontal: 32,
                                  //     ),
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(32),
                                  //       color: Theme.of(context).primaryColor,
                                  //     ),
                                  //     child: Text(
                                  //       AppLocalizations.of(context)
                                  //           .translate("add a comment"),
                                  //       textScaleFactor: 2,
                                  //       style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontSize: 8,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                        ])),
                        SliverPadding(
                          padding: EdgeInsets.all(24),
                          sliver: PagedSliverList.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: 16,
                            ),
                            pagingController: bloc.pagingController,
                            builderDelegate:
                                PagedChildBuilderDelegate<CommentModel>(
                              noItemsFoundIndicatorBuilder: (context) {
                                return Text(AppLocalizations.of(context)
                                    .translate('no comments'));
                              },
                              itemBuilder: (context, item, index) {
                                return CommentWidget(
                                  item,
                                  onReplyTap: (comment)async {
                                    setState(() {
                                      _commentBeingRepliedTo =comment;
                                      _commentController.text = ''; // Clear text field for new reply
                                    });
                                  },
                                  onReply: ([comment, repliedUserId]) {
                                    //replying to root comment
                                    // so repliedUserId is null
                                    if (comment != null)
                                      bloc.add(
                                        CommentAdded(
                                          comment: comment,
                                          repliedUserId: repliedUserId,
                                          id: widget.share.id,
                                          parentCommentId: item.id,
                                        ),
                                      );
                                  }, onEdit: (comment) {
                                  return Future.value(true);
                                },
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// class SendCommentWidget extends StatefulWidget {
//   const SendCommentWidget({
//     Key? key,
//     this.share,
//     this.onCommentAdded,
//   }) : super(key: key);
//   final ShareModel? share;
//   final ValueChanged<CommentModel>? onCommentAdded;
//
//   @override
//   _SendCommentWidgetState createState() => _SendCommentWidgetState();
// }
//
// class _SendCommentWidgetState extends State<SendCommentWidget> {
//   ValueNotifier<bool> _valid = ValueNotifier(false);
//   ValueNotifier<bool> _loading = ValueNotifier(false);
//   final _repo = sl<Repository>();
//
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   void initState() {
//     _controller.addListener(() {
//       if (_controller.text.trim().isNotEmpty) {
//         _valid.value = true;
//       } else {
//         _valid.value = false;
//       }
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final colorSc = Theme.of(context).colorScheme;
//     final primaryColor = colorSc.primary;
//
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: FutureBuilder<UserModel>(
//         future: sl<PrefsHelper>().getUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Container(
//               height: sizeAware.height * 0.05,
//               width: sizeAware.width * 0.3,
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//
//           final user = snapshot.data;
//           if (user == null) {
//             return SizedBox();
//           }
//           return Row(
//             children: [
//               Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(width: 0.3, color: primaryColor)),
//                 child: Center(
//                   child: CircleAvatar(
//                       radius: 60,
//                       backgroundImage: (user.avatar == null || user.avatar == ""
//                           ? AssetImage("assets/images/profile.png")
//                           : CachedNetworkImageProvider(
//                               getImagePath(user.avatar!))) as ImageProvider),
//                 ),
//               ),
//               SizedBox(
//                 width: sizeAware.width * 0.05,
//               ),
//               Expanded(
//                   child: TextFormField(
//                 controller: _controller,
//                 decoration: InputDecoration(hintText: 'إضافة تعليق'),
//               )),
//               ValueListenableBuilder<bool>(
//                 valueListenable: _loading,
//                 builder: (context, loading, child) => SizedBox(
//                   width: 75,
//                   height: 75,
//                   child: ValueListenableBuilder<bool>(
//                     valueListenable: _valid,
//                     builder: (context, value, child) {
//                       if (loading)
//                         return Center(child: CircularProgressIndicator());
//                       return IconButton(
//                         color: primaryColor,
//                         icon: Icon(
//                           Icons.send,
//                         ),
//                         onPressed: value
//                             ? () async {
//                                 _loading.value = true;
//                                 try {
//                                   var text = _controller.text.trim();
//                                   await _repo.addComment(
//                                       widget.share!.id, text);
//                                   widget.onCommentAdded?.call(CommentModel((b) {
//                                     return b
//                                       ..reviewContent = text
//                                       ..user.replace(user);
//                                   }));
//                                   _controller.clear();
//                                 } on NetworkException catch (e) {
//                                   Fluttertoast.showToast(
//                                     msg: e.error,
//                                   );
//                                 }
//                                 _loading.value = false;
//                               }
//                             : null,
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
