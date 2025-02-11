import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/product_content_page/product_content_page.dart';
import 'package:taknikat/Ui/setting_page/my_products/bloc/my_products_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_products/bloc/my_products_event.dart';
import 'package:taknikat/Ui/setting_page/my_products/edit_product_screen.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/product_model/product_model.dart';

import '../image_place_holder.dart';

int getPercentage(total, number) {
  if (total > 0) {
    return 100 - ((number * 100) / total as double).round();
  } else {
    return 0;
  }
}

class ProductItem extends StatelessWidget {
  ProductModel product;
  bool isMine;

  ProductItem(this.product, {this.isMine = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(PageTransition(
                duration: Duration(milliseconds: 700),
                type: PageTransitionType.fade,
                child: ProductContentPage(product)));
          },
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      imageUrl: getImagePath(product.featuredImage.toString()),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover, image: imageProvider),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        child: Icon(
                          Icons.add_location_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          product.country_name??'',
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
                      product.name??'',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(padding: 5.paddingHorizontal,
                  child: Text(
                    product.description ?? 'no desc',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      ' ${(product.price.toString())} ${appCurrencyUS(context)}',
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
                                btnOkText: AppLocalizations.of(context)
                                    .translate("Ok"),
                                btnOkColor: primaryColor,
                                dialogType: DialogType.warning,
                                animType: AnimType.bottomSlide,
                                title: AppLocalizations.of(context)
                                    .translate("Delete Action"),
                                desc: AppLocalizations.of(context).translate(
                                    "are you sure you want to delete this product"),
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                  sl<MyProductsBloc>().add(RemoveProduct(
                                      (p) => p..product.replace(product)));
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
                                  child: EditProductScreen(product)));
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
          )),
    );
  }
}
