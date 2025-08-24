import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:taknikat/Ui/share_content_page/response_share_widget.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/comment.dart';
import 'package:taknikat/core/base_widget/dialogcustom.dart';
import 'package:taknikat/core/base_widget/share_content_card.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/product_model/comment_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';
import 'dart:math' as math;
import '../../core/assets_image/app_images.dart';
import '../../core/constent.dart';
import '../../core/widgets/dialog/base/show_premetion_account_dialog.dart';
import '../../core/widgets/icon_widget.dart';
import '../../injectoin.dart';
import '../auth_screen/page/otp/widgets/auth_header_widget.dart';
import '../setting_page/bloc/settings_bloc.dart';
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
  bool onEditComment=false;

  @override
  Widget build(BuildContext context) {
    final colorSc = Theme.of(context).colorScheme;
    final primaryColor = colorSc.primary;
    return Scaffold(

      body:
      Stack(
        children: [
          SvgPicture.asset(AppImages.head,width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
          BlocProvider(
            create: (context) => sl<ShareBloc>()..shareId = widget.share.id,
            child: Builder(
              builder: (context) {
                final bloc = context.read<ShareBloc>();
                return Column(
                  children: [
                    40.height,
                    AuthHeaderWidget(title: widget.event.name??'',hasLogo: false,),
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
                                    withIconComment: false,
                                    share: widget.share,
                                    event: widget.event,
                                  ),
                                  if (widget.share.status == ShareStatus.approved)
                                    Container(
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 13),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  16.width,
                                                  Text(AppLocalizations.of(context).translate("All comments"),
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  // BlackRegularText(label:  state.comments.length.toString()??'0'),
                                                  // 4.width,
                                                  SvgPicture.asset(AppImages.comment),
                                                  16.width,
                                                ],
                                              ),
                                            ],
                                          ),
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
                                    return Column(
                                      children: [
                                        SvgPicture.asset(AppImages.noFoundData),
                                        5.height,
                                        Text(AppLocalizations.of(context).translate('no comments')),
                                      ],
                                    );
                                  },
                                  itemBuilder: (context, item, index) {
                                    return CommentWidget(
                                      item,
                                      onReplyTap: (comment)async {
                                        setState(() {
                                          onEditComment =false;
                                          _commentBeingRepliedTo =comment;
                                          _commentController.text = ''; // Clear text field for new reply
                                        });
                                      },

                                      onReply: ([comment, repliedUserId]) {

                                        if (comment != null)
                                          bloc.add(
                                            CommentAdded(
                                              comment: comment,
                                              repliedUserId: repliedUserId,
                                              id: widget.share.id,
                                              parentCommentId: item.id,
                                            ),
                                          );
                                      },
                                      onEdit: (comment){
                                        setState(() {
                                          onEditComment =true;
                                          _commentBeingRepliedTo = comment;
                                          _commentController.text = comment.reviewContent??'';
                                        });
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
                    Divider(),
                    if (_commentBeingRepliedTo != null)
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
                    Row(children: [
                        5.width,

                        Center(
                          child: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                              (sl<SettingsBloc>().state.user.avatar == null
                                  ? AssetImage("assets/images/profile.png")
                                  : CachedNetworkImageProvider(getImagePath(
                                  sl<SettingsBloc>().state.user.avatar ??
                                      ''))) as ImageProvider),
                        ),
                        5.width,
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
                                borderRadius:
                                BorderRadius.all(Radius.circular(13)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.all(Radius.circular(13)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.all(Radius.circular(13.0)),
                              ),
                            ),
                          ),
                        ),

                        appLanguage == 'ar'
                            ? Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: Opacity(
                              opacity: 1,
                              child: IconWidget(
                                onTap: ()async{
                                  if (appAuthState) {

                                    await checkPermissionAndShowDialog(
                                    context,
                                    PermissionType.comment.name,
                                    ).then((canDo){
                                      if (canDo) {
                                        if (_commentController.text.trim().isEmpty) {
                                      showToast(AppLocalizations.of(context).translate("Comment text required"));
                                    } else {
                                      if(onEditComment==true){
                                        bloc.add(CommentUpdated(comment: _commentController.text,id: widget.share.id,));
                                        _commentController.text = '';
                                        setState(() {
                                          _commentBeingRepliedTo = null;
                                          onEditComment=false;
                                        });
                                      }
                                      else{
                                        bloc.add(
                                            CommentAdded(
                                                comment: _commentController.text,
                                                id: widget.share.id,
                                                repliedUserId:_commentBeingRepliedTo?.user?.id,
                                                parentCommentId:  _commentBeingRepliedTo?.id
                                            ));
                                        _commentController.text = '';
                                        setState(() {
                                          _commentBeingRepliedTo = null;
                                        });
                                      }

                                    }
                                      }
                                    });


                                  } else {
                                    showLogin(context);
                                  }
                                },
                                height: 40.w,
                                color: Color(0xffF7F7F8),
                                width: 40.w,
                                widget: Padding(
                                  padding:10.paddingAll ,
                                  child: SvgPicture.asset(AppImages.send),
                                ),
                              )),
                        )
                            : SvgPicture.asset(AppImages.send),
                        5.width
                      ],),
                  ],
                );
              },
            ),
          ),
        ],
      )
    );
  }
}