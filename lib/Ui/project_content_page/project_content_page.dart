import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taknikat/Ui/project_content_page/bloc/project_content_bloc.dart';
import 'package:taknikat/Ui/project_content_page/bloc/project_content_event.dart';
import 'package:taknikat/Ui/project_content_page/bloc/project_content_state.dart';
import 'package:taknikat/Ui/report_page/report_class.dart';
import 'package:taknikat/Ui/report_page/widgets/reportButton.dart';
import 'package:taknikat/Ui/share/share_widget.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_click.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/comment.dart';
import 'package:taknikat/core/base_widget/dialogcustom.dart';
import 'package:taknikat/core/base_widget/userInfo.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/video_player.dart';
import 'package:taknikat/core/widgets/custom_button.dart';
import 'package:taknikat/model/project_model/project_model.dart';
import 'dart:math' as math;

import '../../core/assets_image/app_images.dart';
import '../../core/base_widget/back_arrow_button.dart';
import '../../core/base_widget/image_viewer.dart';
import '../../core/image_place_holder.dart';
import '../../core/pod_player.dart';
import '../../core/style/custom_loader.dart';
import '../../core/utils/contact_helper.dart';
import '../../core/widgets/dialog/base/show_premetion_account_dialog.dart';
import '../../core/widgets/icon_widget.dart';
import '../../core/widgets/texts/black_texts.dart';
import '../../core/widgets/texts/primary_texts.dart';
import '../../injectoin.dart';
import '../../model/product_model/comment_model.dart';
import '../setting_page/bloc/settings_bloc.dart';
import '../setting_page/my_posts/post_screen/bloc/post_screen_bloc.dart';

class ProjectContentPage extends StatefulWidget {
  ProjectModel projectData;

  ProjectContentPage(this.projectData);

  @override
  _ProjectContentPageState createState() => _ProjectContentPageState();
}

class _ProjectContentPageState extends State<ProjectContentPage> {
  final bloc = sl<PostScreenBloc>();
  final _bloc = sl<ProjectContentBloc>();

  var _listController = ScrollController();
  bool backToBottom = false;
  bool isLastIndex = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.add(GetComments((b) => b..model_id = widget.projectData.id));
    _listController.addListener(() {
      setState(() {
        backToBottom =
            _listController.offset < _listController.position.maxScrollExtent
                ? true
                : false;
        isLastIndex =
            _listController.offset < _listController.position.maxScrollExtent
                ? true
                : false;
      });
      // if (_listController.position.atEdge) {
      //   if (_listController.position.pixels ==
      //       _listController.position.maxScrollExtent) {
      //     print('GetNext');
      //     _bloc
      //         .add(GetNextComments((b) => b..model_id = widget.projectData.id));
      //   }
      // }
    });
  }

  var _commentController = TextEditingController();
  CommentModel? _commentBeingRepliedTo; // To keep track of the comment being replied to
  bool onEditComment =false;

  @override
  Widget build(BuildContext context) {
    var user2 = widget.projectData.user!;
    return Scaffold(
        floatingActionButton: backToBottom
            ? FloatingActionButton(
                onPressed: () {
                  _listController.animateTo(
                      _listController.position.maxScrollExtent,
                      duration: Duration(seconds: 1),
                      curve: Curves.linear);
                },
                child: FaIcon(
                  FontAwesomeIcons.anglesDown,
                  color: Colors.black26,
                  size: 18,
                ),
                elevation: 2,
                mini: true,
                backgroundColor: Colors.white,
              )
            : null,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            controller: _listController,
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return CachedNetworkImage(
                            placeholderFadeInDuration: Duration(seconds: 1),
                            errorWidget: (context, url, error) => Container(
                                decoration: BoxDecoration(
                                    color: othercolor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Icon(Icons.error)),
                            placeholder: (_, __) =>
                                ImagePlaceholder.rectangular(),
                            imageUrl: getImagePath(
                                widget.projectData.featuredImage.toString()),
                            imageBuilder: (context, provider) => GestureDetector(
                              onTap: () {
                                openBottomSheet(context, provider);
                              },
                              child: Container(
                                width: sizeAware.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: provider, fit: BoxFit.cover)),
                              ),
                            ),
                          );
                        },
                        itemCount: 1,
                        pagination: new SwiperPagination(),
                        control: new SwiperControl(),
                        duration: 300,
                        autoplay: false,
                        index: 0,
                        autoplayDisableOnInteraction: false,
                      ),
                    ),
                    Positioned(
                        top: 20.h,
                        right: 10.w,
                        left: 10.w,
                        child:Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconWidget(
                              onTap: (){
                                report(context: context, modelId: widget.projectData.id.toString(), modelType:ReportType.Project,);
                              },
                              color: Colors.white24,
                              widget: Container(
                                padding: 11.paddingAll,
                                child: SvgPicture.asset(AppImages.repo),
                              ),
                            ),
                            IconWidget(
                              onTap: (){
                                context.pop();
                              },
                              color: Colors.white24,
                              widget: Container(
                                padding: 11.paddingAll,
                                child: appLanguage == 'ar'?Icon(Icons.arrow_forward):Icon(Icons.arrow_back),
                              ),
                            ),
                          ],
                        )
                    )

                    // appLanguage == 'en'
                    //     ? BackButtonArrowLeft(
                    //   top: 20,
                    //   left: 20,
                    // )
                    //     : BackButtonArrowRight(
                    //   top: 20,
                    //   right: 20,
                    // ),
                  ],
                ),


                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 7,
                          spreadRadius: 3
                      )]
                  ),
                  margin: 16.paddingHorizontal+24.paddingBottom+16.paddingTop,
                  padding: 8.paddingAll,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      5.height,
                      Container(

                        child:  Row(
                          children: [
                            15.width,
                            Expanded(child: PrimaryMediumText(label: widget.projectData.name??'',fontSize: 16,),),
                            BlackMediumText(label:  getDateOnly(widget.projectData.createdAt!),fontSize: 12,)
                          ],
                        ),
                        padding: 8.paddingHorizontal,
                      ),
                      Row(
                        children: [

                          Expanded(child:
                         widget.projectData.user!=null?
                          buildUserInfo(context, widget.projectData.user!):SizedBox()),
                          IconWidget(
                            onTap: (){
                              ContactHelper.launchCall(widget.projectData.user?.phoneNumber??'');
                            },
                            padding: 10,
                            widget: SvgPicture.asset(AppImages.phone,color: Colors.black,),
                          ),

                        ],
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if(widget.projectData.user?.city!=null ||widget.projectData.user?.country!=null)
                              IconWidget(
                                padding: 8,
                                widget: Row(
                                  children: [
                                    SvgPicture.asset(AppImages.location5),
                                    5.width,
                                    BlackRegularText(label: '${widget.projectData.user?.city?.name??''} , ${widget.projectData.user?.country?.name??''}')
                                  ],
                                ),
                              ),
                            IconWidget(

                              padding: 8,
                              widget: Row(
                                children: [
                                  SvgPicture.asset(AppImages.cal5),
                                  5.width,
                                  BlackRegularText(label: getDateOnly(widget.projectData.createdAt!))
                                ],
                              ),
                            ),
                            ShareWidget(
                                path: 'projects/${widget.projectData.slug}')

                          ],
                        ),
                      ),
                      12.height,


                    ],
                  ),
                ),
                Container(
                  margin: 16.paddingHorizontal,
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlackMediumText(label: 'تفاصيل الفيديو',fontSize: 16,),
                          if (widget.projectData.isNew ?? false)
                            Chip(
                              label: Text('جديد',
                                  style: TextStyle(color: Colors.white)),
                              backgroundColor: primaryColor,
                            )
                        ],
                      ),
                      Text(
                        widget.projectData.description??'',
                        style: TextStyle(
                            color: secondryColor, fontSize: 14, height: 2),
                        textAlign: TextAlign.right,
                      ),

                    ],
                  ),
                ),
               Container(

                 margin: 14.paddingHorizontal+10.paddingVert,
                 child:  CustomButton(
                     raduis: 12,
                     color:  widget.projectData.youtubeLink?.isEmpty ?? true
                         ? Colors.grey
                         : primaryColor,
                     title: AppLocalizations.of(context).translate("showDetails"),
                     onTap: (){
                       if (widget.projectData.youtubeLink?.isNotEmpty ?? false) {
                         launchURL(widget.projectData.youtubeLink);
                         // Navigator.push(
                         //     context,
                         //     MaterialPageRoute(
                         //         builder: (context) => PlayVideoFromNetwork(
                         //           url: widget.projectData.youtubeLink!,
                         //         )));
                       }
                     }),
               ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(user2.whatsapp!=null && user2.whatsapp!.isNotEmpty)
                      IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: SvgPicture.asset("assets/images/whatsapp.svg",
                            color: primaryColor),
                        onPressed: () => launchURL(user2.whatsapp),
                      ),
                    if(user2.facebook!=null && user2.facebook!.isNotEmpty)
                      IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: SvgPicture.asset("assets/images/facebook.svg",
                            color: primaryColor),
                        onPressed: () => launchURL(user2.facebook),
                      ),
                    if(user2.instagram!=null && user2.instagram!.isNotEmpty)
                      IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: SvgPicture.asset("assets/images/instagram.svg",
                            color: primaryColor),
                        onPressed: () {
                          return launchURL(user2.instagram);
                        },
                      ),
                    if(user2.twitter!=null && user2.twitter!.isNotEmpty)
                      IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: SvgPicture.asset("assets/images/twitter.svg",
                            color: primaryColor),
                        onPressed: () => launchURL(user2.twitter),
                      ),
                    if(user2.linkedin!=null && user2.linkedin!.isNotEmpty)
                      IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: SvgPicture.asset("assets/images/linkedin.svg",
                            color: primaryColor),
                        onPressed: () => launchURL(user2.linkedin),
                      ),
                  ],
                ),
                ),
                BlocBuilder(
                    bloc: _bloc,
                    builder: (BuildContext context, ProjectContentState state) {
                      showToast(state.error);
                      return Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        16.width,
                                        Text(
                                          AppLocalizations.of(context)
                                              .translate("All comments"),
                                          style: TextStyle(
                                            // color: Theme.of(context)
                                            //     .primaryColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        BlackRegularText(label:  state.comments.length.toString()??'0'),
                                        4.width,
                                        SvgPicture.asset(AppImages.comment),
                                        16.width,
                                      ],
                                    ),


                                  ],
                                ),),
                                (state.paginator.totalPage == 1 ||
                                    state.comments.isEmpty)
                                    ? Container()
                                    : TextButton(
                                  onPressed: () {
                                    _bloc.add(GetNextComments(
                                            (b) => b
                                          ..model_id = widget
                                              .projectData.id));
                                  },
                                  child: Text(
                                      'عرض التعليقات السابقة'),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  // height: sizeAware.height,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 13,
                                  ),
                                  child: Column(
                                    children: [
                                      if(state.comments.isEmpty)
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            SvgPicture.asset(
                                              AppImages.sendComment,
                                              // width: 120,
                                              // height: 120,
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
                                        ),
                                      ...state.comments
                                          .map((rootComment) =>
                                          CommentWidget(
                                            rootComment,
                                            repliedUserId: null,
                                            onReply: (
                                                [comment,
                                                  repliedUserId]) {
                                              _bloc.add(AddComment(
                                                    (b) => b
                                                  ..comment =
                                                      comment
                                                  ..repliedUserId =
                                                      repliedUserId
                                                  ..parentCommentId =
                                                      rootComment.id
                                                  ..id = widget
                                                      .projectData
                                                      .id,
                                              ));
                                            }, onReplyTap: (comment)async {
                                            setState(() {
                                              onEditComment =false;
                                              _commentBeingRepliedTo =comment;
                                              _commentController.text = '';
                                            });
                                          }, onEdit: (comment) {
                                            setState(() {
                                              onEditComment =true;
                                              _commentBeingRepliedTo =comment;
                                              _commentController.text = comment.reviewContent??'';
                                            });
                                            return Future.value(true);
                                          },
                                          ))
                                          .toList(),
                                    ],
                                  ),
                                ),
                                if (state.isLoading)
                                  Center(
                                    child: loader(),
                                  )
                              ],
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
                                        '${AppLocalizations.of(context).translate("replying")} ${_commentBeingRepliedTo?.repliedUser?.firstName??''} ${_commentBeingRepliedTo?.repliedUser?.lastName??''}',
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
                                                if (_commentController.text.trim().isEmpty)
                                            {
                                              showToast(AppLocalizations.of(context).translate("Comment text required"));
                                            }
                                            else {
                                              if (state.isLoading != true) {
                                                if (onEditComment == true) {
                                                  _bloc.add(UpdateComment((b) =>
                                                  b..postId = widget.projectData.id
                                                    ..id = _commentBeingRepliedTo!.id
                                                    ..content = _commentController.text
                                                  ));
                                                  _commentController.text = '';
                                                  setState(() {
                                                    _commentBeingRepliedTo =
                                                    null;
                                                    onEditComment = false;
                                                  });
                                                }
                                                else {
                                                  _bloc.add(AddComment((b) =>
                                                  b
                                                    ..comment = _commentController
                                                        .text
                                                    ..id = widget
                                                        .projectData
                                                        .id
                                                    ..repliedUserId = _commentBeingRepliedTo
                                                        ?.user?.id
                                                    ..parentCommentId = _commentBeingRepliedTo
                                                        ?.id));
                                                  _commentController.text = '';
                                                  setState(() {
                                                    _commentBeingRepliedTo =
                                                    null;
                                                  });
                                                }

                                              } else {
                                                showToast(AppLocalizations.of(context).translate("wait"));
                                              }
                                            }
                                              }
                                            });




                                          } else
                                            showLogin(context);
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
                        ),
                      );
                    }),

              ],
            ),
          ),
        ));
  }
}
