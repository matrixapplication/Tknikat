import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/vendor_page/bloc/vendor_state.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/product_item.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

import '../bloc/vendor_bloc.dart';

class VendorProductsTab extends StatelessWidget {
  VendorBloc bloc;
  VendorProductsTab(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: baseText("المنتجات", color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              color: primaryColor,
              height: 30,
            ),
          ),
          Expanded(
            child: BlocBuilder(
                bloc: bloc,
                builder: (BuildContext context, VendorState state) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 13),
                        height: sizeAware.height,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              state.products != null &&
                                      state.products.isNotEmpty
                                  ? Container(
                                      margin: EdgeInsets.all(5),
                                      child: GridView.count(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.630,
                                          crossAxisSpacing: 10.0,
                                          children: List.generate(
                                              state.products.length, (index) {
                                            return ProductItem(
                                              state.products[index],
                                            );
                                          })))
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      if(state.isLoading)
                           Center(child: loader(context: context))
                        
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
