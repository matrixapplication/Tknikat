import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/all_shares_page/all_shares_page.dart';
import 'package:taknikat/Ui/auth_screen/page/signin_page.dart';
import 'package:taknikat/Ui/create_share_page/create_share_page.dart';
import 'package:taknikat/Ui/report_page/report_class.dart';
import 'package:taknikat/Ui/report_page/widgets/reportButton.dart';
import 'package:taknikat/Ui/setting_page/my_shares/my_event_shares.dart';
import 'package:taknikat/Ui/share/share_widget.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/back_arrow_button.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/image_viewer.dart';
import 'package:taknikat/core/base_widget/userInfo.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/data/prefs_helper/prefs_helper.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';

import '../../injectoin.dart';

class EventContentPage extends StatelessWidget {
  final EventModel event;

  EventContentPage(this.event);

  @override
  Widget build(BuildContext context) {
    var languageCode = AppLocalizations.of(context).locale.languageCode;
    var expired = event.endDate != null
        ? DateTime.now().isAfter(DateTime.parse(event.endDate!))
        : false;
    var imagePath = getImagePath(event.image.toString());
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) => Column(
            children: <Widget>[
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      openBottomSheet(
                          context, CachedNetworkImageProvider(imagePath));
                    },
                    child: CachedNetworkImage(
                      placeholderFadeInDuration: Duration(seconds: 1),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: othercolor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(Icons.error)),
                      placeholder: (_, __) => ImagePlaceholder.rectangular(
                          height: 300, borderRadius: BorderRadius.circular(8)),
                      imageUrl: imagePath,
                    ),
                  ),
                  appLanguage == 'en'
                      ? BackButtonArrowLeft()
                      : BackButtonArrowRight(),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                event.name!,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            reportButton(
                              context: context,
                              modelId: event.id.toString(),
                              modelType: ReportType.Event,
                            ),
                          ],
                        ),
                        // child: Text(
                        //   event.name,
                        //   style: Theme.of(context).textTheme.headline6,
                        // ),
                      ),
                      Builder(
                        builder: (context) {
                          var themeData = Theme.of(context);
                          return Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 13,
                                  vertical: 2,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .copyWith(
                                            color: themeData.primaryColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      children: [
                                        TextSpan(
                                            text:
                                                ' ${AppLocalizations.of(context).translate("from")} '),
                                        TextSpan(
                                            text: getDateYmd(event.startDate,
                                                local: languageCode)),
                                        TextSpan(
                                            text:
                                                ' ${AppLocalizations.of(context).translate("to")} '),
                                        TextSpan(
                                            text: getDateYmd(event.endDate,
                                                local: languageCode)),
                                      ]),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1,
                                  vertical: 2,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(
                                          color: themeData.primaryColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    children: [
                                      //Todo count
                                      TextSpan(
                                          text:
                                              '${AppLocalizations.of(context).translate("Share count")}'),
                                      TextSpan(
                                        text: ' : ',
                                      ),
                                      TextSpan(
                                        text: event.shareCount.toString(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              ShareWidget(path: 'events/${event.id}'),
                            ],
                          );
                        },
                      ),
                      if (event.creator != null)
                        if (event.creator?.firstName != null)
                          buildUserInfo(
                            context,
                            event.creator!,
                            padding: EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 0,
                            ),
                          ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 16,
                        ),
                        child: Text(
                          event.description!,
                          textAlign: TextAlign.justify,
                          // style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 10,
                color: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              PageTransition(
                                duration: Duration(milliseconds: 700),
                                type: PageTransitionType.fade,
                                child: event.creator?.isMe ?? false
                                    ? MyEventShares(event: event)
                                    : AllSharesPage(event: event),
                              ),
                            );
                          },
                          child: Text(

                            AppLocalizations.of(context)
                                .translate("Show Shares"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: !expired
                              ? () async {
                                  if (await sl<PrefsHelper>().getIsLogin()) {
                                    if(event.userShare! < event.activationsCount!){
                                      Navigator.of(context).push(PageTransition(
                                          duration: Duration(milliseconds: 700),
                                          type: PageTransitionType.fade,
                                          child:
                                          CreateEditSharePage(event: event)));
                                    }else{
                                      showToast( AppLocalizations.of(context)
                                          .translate("Mess"));
                                    }
                                  } else {
                                    AwesomeDialog(
                                        context: context,
                                        title: AppLocalizations.of(context)
                                            .translate("Login"),
                                        desc: AppLocalizations.of(context)
                                            .translate("login first to share"),
                                        dialogType: DialogType.warning,
                                        btnOk: TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(PageTransition(
                                                    duration: Duration(
                                                        milliseconds: 700),
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: SignInPage()));
                                          },
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .translate("Login"),
                                          ),
                                        ),
                                        btnCancel: TextButton(
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .translate("Cancel"),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )).show();
                                  }
                                }
                              : null,
                          child: expired
                              ? Text(
                                  AppLocalizations.of(context)
                                      .translate("Event Expired"),
                                )
                              : Text(AppLocalizations.of(context)
                                  .translate("Share In Event")),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
