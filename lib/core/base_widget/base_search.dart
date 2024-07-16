import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/home_page/widget/text_card.dart';
import 'package:taknikat/core/base_widget/dialogcustom.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/filters/filter_class.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/category_model/category_model.dart';

import '../app_localizations.dart';

Widget baseSearch(
    _searchController, context, List<CategoryModel> categories, var _bloc) {
  //List<WatchModel>dress, List<WatchModel>perfumes) {
  return categories.isNotEmpty
      ? Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Row(
            children: [
              Flexible(
                  child: textCard(
                name: AppLocalizations.of(context)
                    .translate("Type a word to Search ..."),
                isPassword: false,
                height: 36.0,
                controller: _searchController,
                prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 5),
                    child: GestureDetector(
                      onTap: () {
                        // _bloc.add(GetAllProducts((b) => b
                        //   ..is_new = new_arrived
                        //   ..discount = checkboxDiscount
                        //   ..order_price = order_price
                        //   ..search = _searchController.text));
                      },
                      child: Container(
                        padding: EdgeInsets.all(13),
                        child: SvgPicture.asset("assets/images/search.svg",
                            height: 10, width: 10, color: primaryColor),
                      ),
                    )),
                suffixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 5),
                    child: GestureDetector(
                        onTap: () {
                          showDialogFilter(context, categories.toList(), _bloc,
                              _searchController);
                        },
                        child: Image.asset(
                          "assets/images/filter.png",
                          width: 17,
                          height: 17,
                        ))),
              )),
              GestureDetector(
                  onTap: () {
                    showDialogSort(context, _bloc, _searchController.text);
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor),
                    child: Image.asset(
                      "assets/images/sort.png",
                      width: 16.34,
                      height: 13.81,
                    ),
                  ))
            ],
          ))
      : Container();
}

bool? isRTL;

Widget baseSearchHome(TextEditingController _searchController, context,
    CustomFilter customfilter) {
  TextDirection currentDirection = Directionality.of(context);
  isRTL = currentDirection == TextDirection.rtl;
  //List<WatchModel>dress, List<WatchModel>perfumes) {
  return Container(
      margin: EdgeInsets.symmetric(
          horizontal: sizeAware.height * 0.0100213, vertical: 2),
      width: sizeAware.width,
      child: textCard(
        textAlign: TextAlign.center,
        name:
            AppLocalizations.of(context).translate("Type a word to Search ..."),
        isPassword: false,
        controller: _searchController,
        suffixIcon: InkWell(
          onTap: () {
            customfilter =
                customfilter.copyWith(search: _searchController.text);
            // Navigator.of(context).push(PageTransition(
            //     duration: Duration(milliseconds: 700),
            //     type: PageTransitionType.fade,
            //     child: AllProductsPage(
            //       custom_filter: customfilter,
            //     )));
          },
          child: Container(
            padding: EdgeInsets.all(13),
            child: SvgPicture.asset("assets/images/search.svg",
                height: 10, width: 10, color: primaryColor),
          ),
        ),
        // suffixIcon: Padding(
        //     padding: EdgeInsets.only(bottom: 8),
        //     child: SvgPicture.asset(
        //       "assets/images/filter.png",
        //       width: 13,
        //       height: 14,
        //     )),
      ));
}
