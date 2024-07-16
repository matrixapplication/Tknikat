import 'package:flutter/material.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/product_item.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';

Widget gridProducts(BuildContext context, products, {is_discount = false}) {
  return Padding(
    padding: EdgeInsets.only(
      left: sizeAware.width * 0.02,
      right: sizeAware.width * 0.02,
    ),
    child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 0.680,
        //100/148,//widthButton/heightButton,

        children: List.generate(products.length, (index) {
          // return productListItem(products, index, context);
          return Container(
            margin: EdgeInsets.all(5),
            child: ProductItem(
              products[index],
            ),
          );
        })),
  );
}

Widget gridProductsSeeAll(BuildContext context, products, type, {is_new}) {
  return Column(
    children: [
      // Navigator.of(context).push(
      //     PageTransition(
      //         duration: Duration(
      //             milliseconds: 700),
      //         type: PageTransitionType.fade,
      //         child: AllProductsList(
      //           0,
      //           neww: 1,
      //           search: '',
      //         )));
      Padding(
          padding: EdgeInsets.only(
            left: sizeAware.width * 0.02,
            right: sizeAware.width * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              baseText(AppLocalizations.of(context).translate("New Arrival"),
                  size: sizeAware.width * 0.04,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),

              // InkWell(
              //   onTap: () {
              //     // Navigator.of(context).push(
              //     //     PageTransition(
              //     //         duration: Duration(
              //     //             milliseconds: 700),
              //     //         type: PageTransitionType.fade,
              //     //         child: AllProductsList(
              //     //           0,
              //     //           neww: 1,
              //     //           search: '',
              //     //         )));
              //   },
              //   child: baseText(
              //     title: AppLocalizations.of(context).translate("see all"),
              //     size: sizeAware.width * 0.03,
              //     color: primaryColor,
              //   ),
              // )
            ],
          )),
      GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          //100/148,//widthButton/heightButton,

          children: List.generate(products.length, (index) {
            // return productListItem(products, index, type, context);
            return ProductItem(products[index]);
          })),
    ],
  );
}

Widget listProducts(BuildContext context, products, label) {
  return Container(
    width: sizeAware.width,
    height: sizeAware.height * 0.28437732,
    child: Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
              padding: EdgeInsets.only(
                left: sizeAware.width * 0.02,
                right: sizeAware.width * 0.02,
              ),
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    baseText(label,
                        color: Colors.black, fontWeight: FontWeight.bold),
                    GestureDetector(
                        onTap: () {
                          // CustomFilter _customFilter = new CustomFilter()
                          //   ..search = '';
                          // if (isNew != null && isNew)
                          //   _customFilter.isNew = true;
                          // if (onSale != null && onSale)
                          //   _customFilter.isOnSale = true;
                          // Navigator.of(context).push(PageTransition(
                          //     duration: Duration(milliseconds: 700),
                          //     type: PageTransitionType.fade,
                          //     child: AllProductsPage(
                          //       custom_filter: _customFilter,
                          //     )));
                        },
                        child: baseText(
                          AppLocalizations.of(context).translate("see all"),
                          size: sizeAware.width * 0.03,
                          color: primaryColor,
                        ))
                  ])),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) => Container(
                width: sizeAware.width * 0.442238,
                // child: productListItem(products, index, type, context)),
                child: ProductItem(
                  products[index],
                )),
          ),
        )
      ],
    ),
  );
}
