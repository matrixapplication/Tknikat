import 'package:built_collection/built_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/retails_page/retails_page.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/category_model/category_model.dart';

var _listControllerRetail = ScrollController();

Widget listRetails(
  BuildContext context,
  BuiltList<CategoryModel> categories,
) {
  return Container(
    width: sizeAware.width,
    height: sizeAware.height * 0.27437732,
    child: Column(
      children: [
        GestureDetector(
            onTap: () {
//                                Navigator.of(context).push(MaterialPageRoute(
//                                    builder: (BuildContext context) => ServicesPage()));
            },
            child: Padding(
                padding: EdgeInsets.only(
                    left: sizeAware.width * 0.02,
                    right: sizeAware.width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    baseText(
                        AppLocalizations.of(context).translate("Categories"),
                        size: sizeAware.width * 0.04,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    // InkWell(
                    //   onTap: () {
                    //     // Navigator.of(context).push(PageTransition(
                    //     //     duration: Duration(milliseconds: 700),
                    //     //     type: PageTransitionType.fade,
                    //     //     child: RetailsPage(null)));
                    //   },
                    //   child: baseText(
                    //     title:
                    //         AppLocalizations.of(context).translate("see all"),
                    //     size: sizeAware.width * 0.03,
                    //     color: primaryColor,
                    //   ),
                    // )
                  ],
                ))),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              controller: _listControllerRetail,
              shrinkWrap: true,
              itemExtent: sizeAware.width * 0.892238,
              itemBuilder: (context, index) {
                return Container(
                  width: sizeAware.width * 0.892238,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageTransition(
                          duration: Duration(milliseconds: 700),
                          type: PageTransitionType.fade,
                          child: RetailsPage(categories[index])));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CachedNetworkImage(
                            placeholderFadeInDuration: Duration(seconds: 1),
                            errorWidget: (context, url, error) => Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: othercolor,
                                    borderRadius: BorderRadius.circular(18)),
                                child: Icon(Icons.error)),
                            placeholder: (_, __) =>
                                ImagePlaceholder.rectangular(
                                    borderRadius: BorderRadius.circular(18)),
                            imageUrl: getImagePath(
                                categories[index].image.toString()),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  categories[index].name!,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.white),
                                ),
                                //  Text(
                                //   state.categoryModel[index].description,
                                //   softWrap: true,
                                //   textAlign: TextAlign.center,
                                //   maxLines: 2,
                                //   overflow: TextOverflow.ellipsis,
                                //   style: TextStyle(,color: Colors.white),
                                // ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    ),
  );
}
