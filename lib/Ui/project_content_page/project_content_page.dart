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
import 'package:taknikat/core/video_player.dart';
import 'package:taknikat/model/project_model/project_model.dart';

import '../../core/base_widget/back_arrow_button.dart';
import '../../core/base_widget/image_viewer.dart';
import '../../core/image_place_holder.dart';
import '../../core/pod_player.dart';
import '../../injectoin.dart';
import '../../model/product_model/comment_model.dart';
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
                    appLanguage == 'en'
                        ? BackButtonArrowLeft(
                      top: 20,
                      left: 20,
                    )
                        : BackButtonArrowRight(
                      top: 20,
                      right: 20,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13,vertical: 16),
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context).translate("Insert date:"),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        getDateOnly(widget.projectData.createdAt!),
                        style: TextStyle(
                          color: secondryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      ShareWidget(
                        path: 'projects/${widget.projectData.slug}',
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: buildUserInfo(context, widget.projectData.user!)),
                    reportButton(
                      context: context,
                      modelId: widget.projectData.id.toString(),
                      modelType: ReportType.Project,
                    ),
                  ],
                ),
                // buildUserInfo(context, widget.projectData.user!),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 13, right: 13),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).translate("Country :"),
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.projectData.country_name!,
                            style: TextStyle(
                              color: secondryColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 13, right: 13),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).translate("City :"),
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.projectData.city_name!,
                            style: TextStyle(
                              color: secondryColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 21,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    widget.projectData.description!,
                    style: TextStyle(
                      fontSize: 16,
                      height: 2,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(13),
                  child: baseClick(
                      AppLocalizations.of(context).translate(
                          "To see the video details of the work, click here"),
                      width: double.infinity, onTap: () {
                        print('video: ${widget.projectData.youtubeLink}');
                    if (widget.projectData.youtubeLink?.isNotEmpty ?? false) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayVideoFromNetwork(
                                    url: widget.projectData.youtubeLink!,
                                  )));
                    }
                  },
                      height: 40,
                      color: widget.projectData.youtubeLink?.isEmpty ?? true
                          ? Colors.grey
                          : primaryColor),
                ),
                Row(
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
                // Container(
                //   width: double.infinity,
                //   child: Column(
                //     children: [
                //       Container(
                //         alignment: Alignment.topRight,
                //         margin: EdgeInsets.all(13),
                //         child: Text(
                //             AppLocalizations.of(context)
                //                 .translate("add a comment"),
                //             style: styleTitle),
                //       ),
                //       Container(
                //         width: double.infinity,
                //         margin: EdgeInsets.symmetric(
                //           horizontal: 13,
                //         ),
                //         child: TextField(
                //           onChanged: (value) {
                //             //Do something with the user input.
                //           },
                //           controller: _commentController,
                //           keyboardType: TextInputType.multiline,
                //           textInputAction: TextInputAction.newline,
                //           minLines: 10,
                //           maxLines: 15,
                //           decoration: InputDecoration(
                //             hintText: AppLocalizations.of(context)
                //                 .translate("Add your comment here."),
                //             contentPadding: EdgeInsets.symmetric(
                //                 vertical: 10.0, horizontal: 20.0),
                //             border: OutlineInputBorder(
                //               borderRadius: BorderRadius.all(Radius.circular(13)),
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   color: Theme.of(context).accentColor,
                //                   width: 1.0),
                //               borderRadius: BorderRadius.all(Radius.circular(13)),
                //             ),
                //             focusedBorder: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   color: Theme.of(context).accentColor,
                //                   width: 1.0),
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(13.0)),
                //             ),
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         onTap: () {
                //           if (appAuthState) {
                //             if (_commentController.text.trim().isEmpty) {
                //               showToast(AppLocalizations.of(context)
                //                   .translate("Comment text required"));
                //             } else {
                //               _bloc.add(AddComment((b) => b
                //                 ..comment = _commentController.text
                //                 ..id = widget.projectData.id));
                //               _commentController.text = "";
                //             }
                //           } else
                //             showLogin(context);
                //         },
                //         child: Container(
                //           margin: EdgeInsets.symmetric(
                //             vertical: 13,
                //           ),
                //           padding: EdgeInsets.symmetric(
                //             vertical: 13,
                //             horizontal: 32,
                //           ),
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(32),
                //             color: Theme.of(context).primaryColor,
                //           ),
                //           child: Text(
                //             AppLocalizations.of(context)
                //                 .translate("add a comment"),
                //             textScaleFactor: 2,
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 8,
                //             ),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
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
                                Container(
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.all(13),
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .translate("All comments"),
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                (state.paginator.totalPage == 1 ||
                                        state.comments.isEmpty)
                                    ? Container()
                                    : TextButton(
                                        onPressed: () {
                                          _bloc.add(GetNextComments((b) => b
                                            ..model_id = widget.projectData.id));
                                        },
                                        child: Text('عرض التعليقات السابقة'),
                                      ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 13,
                                  ),
                                  child: Column(
                                    children: [
                                      ...state.comments
                                          .map((rootComment) => CommentWidget(
                                                rootComment,
                                                repliedUserId: null,
                                                onReply: (
                                                    [comment, repliedUserId]) {
                                                  //replying to root comment
                                                  // so repliedUserId is null
                                                  _bloc.add(AddComment(
                                                    (b) => b
                                                      ..comment = comment
                                                      ..repliedUserId =
                                                          repliedUserId
                                                      ..parentCommentId =
                                                          rootComment.id
                                                      ..id =
                                                          widget.projectData.id,
                                                  ));
                                                }, onReplyTap: (comment)async {
                                        setState(() {
                                          onEditComment =false;
                                          _commentBeingRepliedTo =comment;
                                          _commentController.text = ''; // Clear text field for new reply
                                        });
                                      }, onEdit: (comment) {
                                        setState(() {
                                          onEditComment =true;
                                          _commentBeingRepliedTo =comment;
                                          _commentController.text = comment.reviewContent??''; // Clear text field for new reply
                                        });
                                        return Future.value(true);
                                      },
                                              ))
                                          .toList(),
                                      // SizedBox(
                                      //   height: 40,
                                      // )
                                    ],
                                  ),
                                ),
                                if (state.isLoading)
                                  Center(
                                    child: CircularProgressIndicator(),
                                  )
                              ],
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
                            Container(
                              margin: const EdgeInsets.only(
                                  bottom: 13, right: 13, left: 13),
                              child: TextField(
                                maxLines: 5,
                                minLines: 1,
                                onChanged: (value) {
                                  //Do something with the user input.
                                },
                                controller: _commentController,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                decoration: InputDecoration(
                                  suffix: IconButton(
                                      onPressed: () {
                                        if (appAuthState) {
                                          if (_commentController.text
                                              .trim()
                                              .isEmpty) {
                                            showToast(AppLocalizations.of(context)
                                                .translate(
                                                    "Comment text required"));
                                          } else {
                                            //تفاصيل الخدم
                                            if (state.isLoading != true) {
                                              if(onEditComment==true){
                                                _bloc.add(UpdateComment((b) => b
                                                  ..postId = widget.projectData.id
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
                                                  ..id = widget.projectData.id
                                                  ..repliedUserId = _commentBeingRepliedTo?.user?.id
                                                  ..parentCommentId = _commentBeingRepliedTo?.id));
                                                _commentController.text = '';
                                                setState(() {
                                                  _commentBeingRepliedTo = null;
                                                });
                                              }

                                              // _bloc.add(AddComment((b) => b
                                              //   ..comment = _commentController.text
                                              //   ..id = widget.projectData.id));
                                              // _commentController.text = "";
                                            } else {
                                              showToast(
                                                  AppLocalizations.of(
                                                      context)
                                                      .translate(
                                                      "wait"));
                                            }

                                          }
                                        } else
                                          showLogin(context);
                                      },
                                      icon: Icon(
                                        Icons.send,
                                        color: primaryColor,
                                      )),
                                  isCollapsed: true,
                                  fillColor: Color(0xFFF1F2F6),
                                  filled: true,
                                  hintText: AppLocalizations.of(context)
                                      .translate("Add your comment here."),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 5),
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
