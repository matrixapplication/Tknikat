import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:taknikat/Ui/AllNotification_page/bloc/notification_event.dart';
import 'package:taknikat/Ui/AllNotification_page/bloc/notification_state.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/model/notification/notification.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../app/slide_animation.dart';
import '../../core/notifications_service.dart';
import '../../injectoin.dart';
import 'bloc/notification_bloc.dart';

class AllNotificationPage extends StatefulWidget {
  @override
  _AllNotificationPageState createState() => _AllNotificationPageState();
}

class _AllNotificationPageState extends State<AllNotificationPage> {
  final _bloc = sl<NotificationBloc>();
  var _listController = ScrollController();

  @override
  void initState() {
    removeBadge();
    super.initState();
    if (appAuthState) {
      _bloc.add(TryGetNotification());
      _listController.addListener(() {
        if (_listController.position.atEdge) {
          if (_listController.position.pixels ==
              _listController.position.maxScrollExtent) {
            print('GetNext');
            _bloc.add(GetNext());
          }
        }
      });
    }
    _bloc.add(ChangeNotificationStatus());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, NotificationState state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                // brightness: Brightness.light,
                systemOverlayStyle:
                    AppBarTheme.of(context).systemOverlayStyle?.copyWith(
                          statusBarBrightness: Brightness.light,
                        ),
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
                title: baseText(
                  AppLocalizations.of(context).translate("Notifications"),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  size: sizeAware.width * 0.04,
                ),
              ),
              body: Stack(
                children: [
                  RefreshIndicator(
                    color: primaryColor,
                    onRefresh: () async {
                      _bloc.add(ChangeNotificationStatus());
                      _bloc.add(TryGetNotification());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        if (state.notifications.isNotEmpty)
                          Expanded(
                            child: AnimationLimiter(
                              child: ListView.separated(
                                  controller: _listController,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(4),
                                  separatorBuilder: (_, __) => Divider(
                                        height: 4,
                                        thickness: 2,
                                      ),
                                  itemCount: state.notifications.length,
                                  itemBuilder: (context, index) {
                                    var notification =
                                        state.notifications[index];

                                    return SlidStaggeredListAnimation(
                                      index: index,
                                      child: Container(
                                        color: notification.read == 0
                                            ? primaryColor.withOpacity(0.1)
                                            : Theme.of(context).cardColor,
                                        child: GestureDetector(
                                            onTap: () {
                                              if (notification.data != null)
                                                open(jsonDecode(notification.data!.toJson()),
                                                    context);
                                                // print("test ${jsonDecode(notification.data!.toJson().toString())}");
                                              _bloc.add(ChangeNotificationStatus());
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: state
                                                                .notifications[
                                                                    index]
                                                                .image !=
                                                            null
                                                        ? CachedNetworkImage(
                                                            placeholderFadeInDuration:
                                                                Duration(
                                                                    seconds: 1),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                CircleAvatar(
                                                                  radius: sizeAware
                                                                          .width *
                                                                      0.102564102564103,
                                                                  // backgroundColor:
                                                                  //     primaryColor,
                                                                  backgroundImage:
                                                                      AssetImage(
                                                                          "assets/images/taknikat.png"),
                                                                ),
                                                            imageUrl: state
                                                                .notifications[
                                                                    index]
                                                                .image
                                                                .toString(),
                                                            imageBuilder: (context,
                                                                    imageProvider) =>
                                                                CircleAvatar(
                                                                  radius: sizeAware
                                                                          .width *
                                                                      0.102564102564103,
                                                                  backgroundImage:
                                                                      imageProvider,
                                                                ),
                                                            placeholder: (context,
                                                                    url) =>
                                                                ImagePlaceholder.circular(
                                                                  radius: sizeAware
                                                                          .width *
                                                                      0.102564102564103,
                                                                ))
                                                        : Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(30),
                                                            child: Icon(Icons
                                                                .notifications_none_outlined),
                                                          ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        buildString(state,
                                                            index, context),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.access_time,
                                                              size: 14,
                                                            ),
                                                            SizedBox(
                                                              width: 2,
                                                            ),
                                                            baseText(
                                                              timeago.format(
                                                                DateTime.parse(state
                                                                    .notifications[
                                                                        index]
                                                                    .createdAt!),
                                                                locale: AppLocalizations.of(
                                                                        context)
                                                                    .locale
                                                                    .languageCode,
                                                              ),
                                                              // state.notifications[index].createdAt.substring(14,19),
                                                              color:
                                                                  Colors.grey,
                                                              size: 12.0,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                      ],
                    ),
                  ),
                  state.isLoading
                      ? Center(
                          child: loader(context: context),
                        )
                      : state.notifications.isEmpty
                          ? Container(
                              width: sizeAware.width,
                              height: sizeAware.height * 0.8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: SvgPicture.asset(
                                      "assets/images/empty_notification.svg",
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Text(
                                        AppLocalizations.of(context)
                                            .translate("empty Notifications"),
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontFamily: "Tajawal",
                                        )),
                                  )
                                ],
                              ))
                          : Container()
                ],
              ));
        });
  }

  Widget buildEventNotificationWidget(
      BuildContext context, Notification notification) {
    return RichText(
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: notification.message!.replaceAll('\n', " ") + ' ',
          ),
          TextSpan(
            text: notification.title!.replaceAll('\n', " ") + ' ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildString(NotificationState state, int index, BuildContext context) {
    var notification = state.notifications[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          notification.title!,
          style: DefaultTextStyle.of(context).style.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        RichText(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            text: notification.message!.replaceAll('\n', ' '),
          ),
        ),
        // if (notification.data?.comment != null &&
        //     notification.data!.comment!.isNotEmpty)
        //   RichText(
        //     maxLines: 2,
        //     overflow: TextOverflow.ellipsis,
        //     text: TextSpan(
        //       style: DefaultTextStyle.of(context).style,
        //       text: html_parser
        //           .parseFragment(notification.data?.comment ?? '')
        //           .text,
        //     ),
        //   )
      ],
    );

    // final title = Column(
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: [
    //     RichText(
    //       maxLines: 4,
    //       overflow: TextOverflow.ellipsis,
    //       text: TextSpan(
    //         style: DefaultTextStyle.of(context).style,
    //         children: [
    //           if ((notification.data?.comment?.isNotEmpty ?? false) &&
    //               notification.message == '')
    //             TextSpan(
    //               text: 'commented'.tr(context) + " ",
    //             ),
    //           if ((notification.data?.comment?.isNotEmpty ?? false) &&
    //               notification.message == '')
    //             TextSpan(
    //                 text: notification.title!,
    //                 style: TextStyle(fontWeight: FontWeight.bold)),
    //           if ((notification.data?.comment?.isNotEmpty ?? false) &&
    //               notification.message == '')
    //             TextSpan(
    //               text: ' ',
    //             ),
    //           if ((notification.data?.comment?.isNotEmpty ?? false) &&
    //               notification.message == '')
    //             TextSpan(text: 'on'.tr(context)),
    //           if ((notification.data?.comment?.isNotEmpty ?? false) &&
    //               notification.message == '')
    //             TextSpan(
    //               text: ' ',
    //             ),
    //           TextSpan(
    //               text: notification.message!.replaceAll('\n', " ") + ' ',
    //               style: TextStyle(fontWeight: FontWeight.bold)),
    //           if (notification.data?.comment?.isNotEmpty ?? false)
    //             TextSpan(
    //               text: ['"', document, '"'].join(),
    //             ),
    //         ],
    //       ),
    //     )
    //   ],
    // );

    // return title;
  }

  Widget _old() {
    return new Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                    elevation: 5,
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: <Widget>[
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 0.0, right: 0.0),
                                        leading: Image.asset(
                                          "assets/images/dress.png",
                                          width: 68,
                                          height: 68,
                                        ),
                                        title: Row(
                                          children: [
                                            baseText(
                                              "تم إضافة منتج جديد/ قسم العطور",
                                              color: primaryColor,
                                              size: 8.0,
                                            ),
                                          ],
                                        ),
                                        subtitle: baseText(
                                          "عطر رويال لونكم النرويجي 200 ملي ",
                                          color: Colors.black,
                                          size: 10.0,
                                        ),
                                        trailing: baseText(
                                          "4:50 pm  ",
                                          color: primaryColor,
                                          size: 10.0,
                                        ),
                                      ))),
                            ],
                          ),
                        ],
                      ),
                    )));
          }),
    );
  }
}
