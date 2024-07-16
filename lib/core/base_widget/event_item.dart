import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/events_content_page/events_content_page.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/my_events_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_events/bloc/my_events_event.dart';
import 'package:taknikat/Ui/setting_page/my_events/edit_event_screen.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/event_model/event_model.dart';

import '../app_localizations.dart';
import '../image_place_holder.dart';

class EventItem extends StatelessWidget {
  final EventModel event;
  final bool isMine;

  EventItem(this.event, {this.isMine = false});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: EventContentPage(event)));
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: CachedNetworkImage(
                      placeholderFadeInDuration: Duration(seconds: 1),
                      errorWidget: (context, url, error) => Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: othercolor,
                            borderRadius: BorderRadius.circular(15)),
                        child: FittedBox(
                          child: Icon(Icons.error),
                        ),
                      ),
                      placeholder: (_, __) => ImagePlaceholder.rectangular(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      imageUrl: getImagePath(event.image.toString()),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill, image: imageProvider),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          event.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: primaryColor,
                      size: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        event.shareCount.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    DateTimeText(
                      date: event.startDate!,
                      color: Colors.green,
                    ),
                    Spacer(),
                    DateTimeText(
                      date: event.endDate!,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
            isMine
                ? Positioned.directional(
                    end: 10,
                    textDirection: Directionality.of(context),
                    top: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              customHeader: Container(
                                child: Icon(
                                  Icons.delete_forever_outlined,
                                  size: 60,
                                  color: primaryColor,
                                ),
                              ),
                              btnCancelText: AppLocalizations.of(context)
                                  .translate("Cancel"),
                              btnOkText:
                                  AppLocalizations.of(context).translate("Ok"),
                              btnOkColor: primaryColor,
                              dialogType: DialogType.warning,
                              animType: AnimType.bottomSlide,
                              title: AppLocalizations.of(context)
                                  .translate("Delete Action"),
                              desc: '',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                sl<MyEventsBloc>().add(RemoveEvent(
                                    (p) => p..event.replace(event)));
                              },
                            )..show();
                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              child: FittedBox(
                                child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    )),
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(PageTransition(
                                duration: Duration(milliseconds: 700),
                                type: PageTransitionType.fade,
                                child: EditEventScreen(
                                  eventModel: event,
                                )));
                          },
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              child: FittedBox(
                                child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: primaryColor,
                                    )),
                              )),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class DateTimeText extends StatelessWidget {
  final String date;
  final Color? color;

  const DateTimeText({
    Key? key,
    required this.date,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var languageCode = AppLocalizations.of(context).locale.languageCode;

    return Row(children: [
      Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      SizedBox(
        width: 4,
      ),
      Text(
        getDateYmd(date, local: languageCode),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      )
    ]);
  }
}
