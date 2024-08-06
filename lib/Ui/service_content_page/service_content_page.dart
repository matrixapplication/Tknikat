import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taknikat/Ui/report_page/report_class.dart';
import 'package:taknikat/Ui/report_page/widgets/reportButton.dart';
import 'package:taknikat/Ui/share/share_widget.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/back_arrow_button.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/comment.dart';
import 'package:taknikat/core/base_widget/contactInfo.dart';
import 'package:taknikat/core/base_widget/dialogcustom.dart';
import 'package:taknikat/core/base_widget/image_viewer.dart';
import 'package:taknikat/core/base_widget/info_item.dart';
import 'package:taknikat/core/base_widget/userInfo.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/model/service_model/service_model.dart';

import '../../injectoin.dart';
import '../../model/product_model/comment_model.dart';
import '../setting_page/my_posts/post_screen/bloc/post_screen_bloc.dart';
import 'bloc/service_content_bloc.dart';
import 'bloc/service_content_event.dart';
import 'bloc/service_content_state.dart';

class ServiceContentPage extends StatefulWidget {
  ServiceModel serviceData;

  ServiceContentPage(this.serviceData);

  @override
  _ServiceContentPageState createState() => _ServiceContentPageState();
}

class _ServiceContentPageState extends State<ServiceContentPage> {
  final _bloc = sl<ServiceContentBloc>();
  var _listController = ScrollController();
  bool backToBottom = false;
  bool isLastIndex = false;
  @override
  void initState() {
    super.initState();
    _bloc.add(GetComments((b) => b..model_id = widget.serviceData.id));
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
      //         .add(GetNextComments((b) => b..model_id = widget.serviceData.id));
      //   }
      // }
    });
  }

  var _commentController = TextEditingController();
  CommentModel? _commentBeingRepliedTo; // To keep track of the comment being replied to
  bool onEditComment =false;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    var userModel = widget.serviceData.user!;
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return widget.serviceData.images!.length > 0
                          ? CachedNetworkImage(
                              placeholderFadeInDuration: Duration(seconds: 1),
                              errorWidget: (context, url, error) => Container(
                                  decoration: BoxDecoration(
                                      color: othercolor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Icon(Icons.error)),
                              placeholder: (_, __) =>
                                  ImagePlaceholder.rectangular(
                                      borderRadius: BorderRadius.circular(8)),
                              imageUrl: getImagePath(
                                  widget.serviceData.images![index].toString()),
                              imageBuilder: (context, imageProvider) =>
                                  GestureDetector(
                                onTap: () {
                                  openBottomSheet(context, imageProvider);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: imageProvider),
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            )
                          : CachedNetworkImage(
                              placeholderFadeInDuration: Duration(seconds: 1),
                              errorWidget: (context, url, error) => Container(
                                  decoration: BoxDecoration(
                                      color: othercolor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Icon(Icons.error)),
                              placeholder: (_, __) =>
                                  ImagePlaceholder.rectangular(),
                              imageUrl: getImagePath(
                                  widget.serviceData.featuredImage.toString()),
                              imageBuilder: (context, provider) =>
                                  GestureDetector(
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
                    itemCount: widget.serviceData.images?.length == 0
                        ? 1
                        : widget.serviceData.images?.length??0,
                    pagination: new SwiperPagination(),
                    control: new SwiperControl(),
                    duration: 300,
                    autoplay: false,
                    index: 0,
                    autoplayDisableOnInteraction: false,
                  ),
                ),
                appLanguage == 'en'
                    ? BackButtonArrowLeft()
                    : BackButtonArrowRight(),
              ],
            ),

            Row(
              children: [
                Expanded(child: buildUserInfo(context, userModel)),
                Align(
                  alignment: Alignment.topLeft,
                  child: ShareWidget(path: 'services/${widget.serviceData.id}'),
                ),
                reportButton(
                  context: context,
                  modelId: widget.serviceData.id.toString(),
                  modelType: ReportType.Service,
                ),
              ],
            ),
            // buildUserInfo(context, userModel),
            Container(
              width: MediaQuery.of(context).size.width,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Color(0xffF9F9F9),
                  borderRadius: BorderRadius.circular(12.0)),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InfoWidget(
                        icon: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset(
                            "assets/images/money2.svg",
                            height: 22,
                          ),
                        ),
                        label: ' ${(widget.serviceData.price.toString())} ${appCurrency(context)}',
                      ),
                      VerticalDivider(
                        color: Colors.grey.shade400,
                      ),
                      InfoWidget(
                        icon: Icon(Icons.location_on_outlined,
                            color: themeData.primaryColor),
                        label: widget.serviceData.country_name!,
                      ),
                      VerticalDivider(
                        color: Colors.grey.shade400,
                      ),
                      InfoWidget(
                        icon: Icon(Icons.location_on_outlined,
                            color: themeData.primaryColor),
                        label: widget.serviceData.city_name!,
                      ),
                      VerticalDivider(
                        color: Colors.grey.shade400,
                      ),
                      InfoWidget(
                        icon: Icon(Icons.date_range_rounded,
                            color: themeData.primaryColor),
                        label: getDateOnly(widget.serviceData.createdAt!),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).translate("service_details"),
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: themeData.primaryColor),
                  ),
                  if (widget.serviceData.isNew ?? false)
                    Chip(
                      label:
                          Text(
                              AppLocalizations.of(context).translate("New"), style: TextStyle(color: Colors.white)),
                      backgroundColor: themeData.primaryColor,
                    )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 13,
              ),
              width: MediaQuery.of(context).size.width,
              child: Text(
                widget.serviceData.description!,
                style: TextStyle(color: secondryColor, fontSize: 14, height: 2),
                textAlign: TextAlign.right,
              ),
            ),
            contactInfo(userModel),
            // Container(
            //   width: double.infinity,
            //   child: Column(
            //     children: [
            //       Container(
            //         alignment: Alignment.topRight,
            //         margin: EdgeInsets.all(13),
            //         child: Text(
            //             AppLocalizations.of(context).translate("add a comment"),
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
            //                   color: themeData.colorScheme.secondary,
            //                   width: 1.0),
            //               borderRadius: BorderRadius.all(Radius.circular(13)),
            //             ),
            //             focusedBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                   color: themeData.colorScheme.secondary,
            //                   width: 1.0),
            //               borderRadius: BorderRadius.all(Radius.circular(13.0)),
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
            //                 ..id = widget.serviceData.id));
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
            //             AppLocalizations.of(context).translate("add a comment"),
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
                builder: (BuildContext context, ServiceContentState state) {
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
                                      _bloc.add(GetNextComments((b) =>
                                          b..model_id = widget.serviceData.id));
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
                                                  ..id = widget.serviceData.id,
                                              ));
                                            }, onReplyTap: (comment)async {
                                              setState(() {
                                                onEditComment =false;
                                                _commentBeingRepliedTo =comment;
                                    _commentController.text = ''; // Clear text field for new reply
                                  }); },
                                    onEdit: (comment) {
                                           setState(() {
                                            onEditComment =true;
                                            _commentBeingRepliedTo =comment;
                                            _commentController.text = comment.reviewContent??''; // Clear text field for new reply
                                                   });
                                                return Future.value(true); },
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
                                        if (state.isLoading !=
                                            true) {
                                          if(onEditComment==true){
                                            _bloc.add(UpdateComment((b) => b
                                              ..postId = widget.serviceData.id
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
                                              ..id = widget.serviceData.id
                                              ..repliedUserId = _commentBeingRepliedTo?.user?.id
                                              ..parentCommentId = _commentBeingRepliedTo?.id));
                                            _commentController.text = '';
                                            setState(() {
                                              _commentBeingRepliedTo = null;
                                            });
                                          }


                                          // _bloc.add(AddComment((b) => b
                                          //   ..comment = _commentController.text
                                          //   ..id = widget.serviceData.id));
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
    );
  }
}
