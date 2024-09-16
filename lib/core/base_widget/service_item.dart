import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/service_content_page/service_content_page.dart';
import 'package:taknikat/Ui/setting_page/my_services/bloc/my_services_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_services/bloc/my_services_event.dart';
import 'package:taknikat/Ui/setting_page/my_services/edit_service_screen.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/service_model/service_model.dart';

import '../app_localizations.dart';
import '../image_place_holder.dart';

class ServiceItem extends StatelessWidget {
  final ServiceModel service;
  final bool isMine;
  ServiceItem(this.service, {this.isMine = false});

  @override
  Widget build(BuildContext context) {
    //تفاصيل الخدمة
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: ServiceContentPage(service)));
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
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
                    imageUrl: getImagePath(service.featuredImage.toString()),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill, image: imageProvider),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Icon(
                        Icons.add_location_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Container(
                      child: Text(
                        service.country_name!,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        softWrap: false,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  alignment: Alignment.centerRight,
                  child: Text(
                    service.name!,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  service.description ?? 'no desc',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.right,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    ' ${(service.price.toString())}${appCurrency(context)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 13,
                    ),
                  ),
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
                              desc: AppLocalizations.of(context).translate(
                                  "are you sure you want to delete this service"),
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                sl<MyServicesBloc>().add(RemoveService(
                                    (p) => p..service.replace(service)));
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
                                child: EditServiceScreen(service)));
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
