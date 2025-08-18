import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/service_content_page/service_content_page.dart';
import 'package:taknikat/Ui/services_page/bloc/services_bloc.dart';
import 'package:taknikat/Ui/services_page/bloc/services_event.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/service_model/service_model.dart';

import '../../../core/app_localizations.dart';

Widget gridServices(
  BuildContext context,
  List<ServiceModel> services,
  ScrollController controller,
) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.75,
    ),
    controller: controller,
    padding: EdgeInsets.only(
      left: sizeAware.width * 0.02,
      right: sizeAware.width * 0.02,
    ),
    itemCount: services.length,
    itemBuilder: (context, index) => serviceListItem(services, index, context),
    //100/148,//widthButton/heightButton,
  );
}

Widget serviceListItem(services, int index, BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageTransition(
            duration: Duration(milliseconds: 700),
            type: PageTransitionType.fade,
            child: ServiceContentPage(services[index])));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      placeholderFadeInDuration: Duration(seconds: 1),
                      errorWidget: (context, url, error) => Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: othercolor,
                            borderRadius: BorderRadius.circular(16)),
                        child: FittedBox(
                          child: Icon(Icons.error),
                        ),
                      ),
                      placeholder: (_, __) => ImagePlaceholder.rectangular(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      imageUrl:
                      getImagePath(services[index].featuredImage.toString()),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(

                                fit: BoxFit.cover, image: imageProvider),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // Expanded(child:
                   //
                   // baseText(services[index].name, color: Colors.black),),
                    Expanded(child:

                   BlackMediumText(label: services[index].name,fontSize: 14,maxLines: 1,)),
                    
                    // showDiscount
                    //     ? Row(
                    //         children: [
                    //           Text(
                    //             services[index]
                    //                     .priceBeforeDiscount
                    //                     .toString() +
                    //                 " ",
                    //             style: TextStyle(
                    //                 fontFamily: "Tajawal",
                    //                 textBaseline: TextBaseline.alphabetic,
                    //                 decoration: TextDecoration.lineThrough,
                    //                 color: Colors.red),
                    //           ),
                    //           baseText(
                    //               services[index].price.toString() +
                    //                   " " +
                    //                   appCurrency,
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.black),
                    //         ],
                    //       )
                    //     :
                    baseText(
                        services[index].price.toString() + " " + appCurrency(context),
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ],
                ),
              ),
            )
          ],
        ),
      ));
}

var selectedDate = DateTime.now();

_selectDate(BuildContext context, int service_id, ServicesBloc bloc) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    // Refer step 1
    firstDate: DateTime(2000),
    currentDate: selectedDate,
    locale: appLanguage == 'ar' ? Locale('ar') : Locale('en'),
    lastDate: DateTime(2025),
  );
  if (picked != null && picked != selectedDate)
    // setState(() {
    selectedDate = picked;
  bloc.add(GetDayShifts((b) => b
    ..service_id = service_id
    ..date = picked));
  // });
}
