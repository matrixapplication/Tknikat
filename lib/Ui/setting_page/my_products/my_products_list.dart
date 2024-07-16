import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/my_products/add_product_screen.dart';
import 'package:taknikat/Ui/setting_page/my_products/bloc/my_products_event.dart';
import 'package:taknikat/Ui/setting_page/my_products/my_product.dart';
import 'package:taknikat/Ui/setting_page/my_products/my_products_page.dart';
import 'package:taknikat/Ui/setting_page/widget/show_all_button.dart';

import '../../../core/app_localizations.dart';
import '../../../injectoin.dart';
import 'bloc/my_products_bloc.dart';
import 'bloc/my_products_state.dart';

class MyProductList extends StatefulWidget {
  @override
  _MyProductListState createState() => _MyProductListState();
}

class _MyProductListState extends State<MyProductList> {
  @override
  void initState() {
    sl<MyProductsBloc>().add(GetMyProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: sl<MyProductsBloc>(),
        builder: (BuildContext context, MyProductsState state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)
                        .translate("Products"),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  ShowAllButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyProductsPage(),
                    )),
                  )
                ],
              ),
              Container(
                height: 200,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 105,
                          height: 135,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(15, 52, 157, 216),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(PageTransition(
                                    duration: Duration(milliseconds: 700),
                                    type: PageTransitionType.fade,
                                    child: AddProductScreen()));
                              },
                              icon: SvgPicture.asset(
                                  "assets/images/addButton.svg"),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          AppLocalizations.of(context)
                              .translate("Add_product"),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 13),
                    ...state.myProducts.map((product) => MyProductItem(product))
                  ],
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          );
        });
  }
}
