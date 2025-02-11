import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/all_shares_page/all_shares_page.dart';
import 'package:taknikat/Ui/auth_screen/page/signin_page.dart';
import 'package:taknikat/Ui/create_share_page/create_share_page.dart';
import 'package:taknikat/Ui/report_page/report_class.dart';
import 'package:taknikat/Ui/report_page/widgets/reportButton.dart';
import 'package:taknikat/Ui/setting_page/my_shares/my_event_shares.dart';
import 'package:taknikat/Ui/share/share_widget.dart';
import 'package:taknikat/app/App.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/back_arrow_button.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import 'package:taknikat/core/base_widget/image_viewer.dart';
import 'package:taknikat/core/base_widget/userInfo.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/core/widgets/custom_button.dart';
import 'package:taknikat/data/prefs_helper/prefs_helper.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';

import '../../core/assets_image/app_images.dart';
import '../../core/utils/contact_helper.dart';
import '../../core/widgets/icon_widget.dart';
import '../../core/widgets/texts/black_texts.dart';
import '../../core/widgets/texts/primary_texts.dart';
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
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Container(
                          height: 300,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              color: othercolor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(Icons.error)),
                      placeholder: (_, __) => ImagePlaceholder.rectangular(
                          height: 300, borderRadius: BorderRadius.circular(8)),
                      imageUrl: imagePath,
                    ),
                  ),
                  Container(
                    height: 300,
                   decoration: BoxDecoration(
                     gradient: LinearGradient(
                       begin: Alignment.bottomCenter,
                       end: Alignment.center,
                       colors: [
                         Colors.black54,
                         Colors.black45,
                         Colors.black26,
                         Colors.black12,
                         Colors.transparent,
                         Colors.transparent,
                       ]
                     )
                   ),
                  ),
                  Positioned(
                    bottom: 10.h,
                    right: 10.w,
                    left: 10.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(20)
                            ),
                          padding: 10.paddingHorizontal,
                          child: Row(
                          children: [
                              SvgPicture.asset(AppImages.flash),
                              PrimaryMediumText(label:event.shareCount.toString(),fontSize: 14,)
                          ],
                        ),)
                      ],
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
                              report(context: context, modelId: event.id.toString(), modelType:ReportType.Event,);
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
                  //     ? BackButtonArrowLeft()
                  //     : BackButtonArrowRight(),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        margin: 16.paddingHorizontal+24.paddingVert,
                        padding: 8.paddingAll,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.height,
                            Container(

                              child:  Row(
                                children: [
                                  Expanded(child: PrimaryMediumText(label: event.name??'',fontSize: 18,),),

                                ],
                              ),
                              padding: 8.paddingHorizontal,
                            ),
                            Row(
                              children: [
                                Expanded(child: buildUserInfo(context, event.creator??UserModel())),
                                IconWidget(
                                  onTap: (){
                                    ContactHelper.launchCall(event.creator?.phoneNumber??'');
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
                                  // if(event.creator?.city!=null ||event.creator?.country!=null)
                                  //   IconWidget(
                                  //     padding: 8,
                                  //     widget: Row(
                                  //       children: [
                                  //         SvgPicture.asset(AppImages.location5),
                                  //         5.width,
                                  //         BlackRegularText(label: '${event.creator?.city?.name??''} , ${event.creator?.country?.name??''}')
                                  //       ],
                                  //     ),
                                  //   ),
                                  IconWidget(

                                    padding: 8,
                                    widget: Row(
                                      children: [
                                        SvgPicture.asset(AppImages.cal5),
                                        5.width,
                                        BlackRegularText(label: '${getLangLocalization('From')} '),
                                        PrimaryRegularText(label: getDateOnly(event.startDate!)),
                                        BlackRegularText(label: ' ${getLangLocalization('To')} '),
                                        PrimaryRegularText(label: getDateOnly(event.endDate!)),

                                      ],
                                    ),
                                  ),
                                  ShareWidget(
                                      path: 'events/${event.id}')

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
                                BlackMediumText(label: 'تفاصيل الفعالية',fontSize: 16,),

                              ],
                            ),
                            Text(
                             event.description??'',
                              style: TextStyle(
                                  color: secondryColor, fontSize: 14, height: 2),
                              textAlign: TextAlign.justify,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 5
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Expanded(
                        child:
                        CustomButton(

                          onTap: (){
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
                          title: AppLocalizations.of(context).translate("Show Shares"),
                        ),
                      ),
                      SizedBox(width: 16.w,),
                      Expanded(
                        child:
                        CustomButton(
                          isOutlined: true,
                          onTap:    !expired
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
                              : (){},
                          title: expired?AppLocalizations.of(context).translate("Event Expired"):AppLocalizations.of(context).translate("Share In Event"),

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
