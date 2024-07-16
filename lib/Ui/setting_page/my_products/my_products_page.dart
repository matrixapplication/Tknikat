import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/Ui/setting_page/my_products/add_product_screen.dart';
import 'package:taknikat/Ui/setting_page/my_products/bloc/my_products_state.dart';
import 'package:taknikat/Ui/setting_page/my_services/my_service.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/product_item.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';

import '../../../core/app_localizations.dart';
import 'bloc/my_products_bloc.dart';
import 'bloc/my_products_event.dart';

class MyProductsPage extends StatefulWidget {
  @override
  _MyProductsPageState createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  @override
  void initState() {
    sl<MyProductsBloc>().add(GetMyProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: baseText(AppLocalizations.of(context)
            .translate("Products"), color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: AddProductScreen()));
        },
        backgroundColor: primaryColor,
        mini: true,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              color: primaryColor,
              child: Column(
                children: [
                  Container(height: 20),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder(
                bloc: sl<MyProductsBloc>(),
                builder: (BuildContext context, MyProductsState state) {
                  return Stack(
                    children: [
                      Container(
                        height: sizeAware.height,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              state.myProducts != null &&
                                      state.myProducts.isNotEmpty
                                  ? Container(
                                      margin: EdgeInsets.all(5),
                                      child: GridView.count(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.630,
                                        crossAxisSpacing: 10.0,
                                        children: List.generate(
                                            state.myProducts.length, (index) {
                                          return ProductItem(
                                            state.myProducts[index],
                                            isMine: true,
                                          );
                                        }),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      state.isLoading
                          ? Center(child: loader(context: context))
                          : state.myProducts != null && state.myProducts.isEmpty
                              ? Container(
                                  width: sizeAware.width,
                                  height: sizeAware.height * 0.8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: SvgPicture.asset(
                                          "assets/images/empty_content.svg",
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .translate("not_found_product"),
                                          style: TextStyle(),
                                        ),
                                      )
                                    ],
                                  ))
                              : Container()
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
