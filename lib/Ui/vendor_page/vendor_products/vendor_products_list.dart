import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_products/my_product.dart';
import 'package:taknikat/Ui/vendor_page/bloc/vendor_state.dart';
import 'package:taknikat/Ui/vendor_page/vendor_products/vendor_products_tab.dart';
import 'package:taknikat/Ui/vendor_page/widget/show_all_button.dart';

import 'package:taknikat/injectoin.dart';

import '../bloc/vendor_bloc.dart';

class VendorProductsList extends StatelessWidget {
  VendorBloc bloc;
  VendorProductsList(this.bloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, VendorState state) {
          return state.products.isNotEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المنتجات',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        ShowAllButton(
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => VendorProductsTab(bloc),
                          )),
                        )
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        children: [
                          ...state.products
                              .map((product) => MyProductItem(product))
                        ],
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                )
              : Container();
        });
  }
}
