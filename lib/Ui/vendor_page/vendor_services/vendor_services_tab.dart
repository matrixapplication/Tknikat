import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/vendor_page/bloc/vendor_state.dart';
import 'package:taknikat/core/base_widget/base_text.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/core/base_widget/service_item.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import '../../../injectoin.dart';
import '../bloc/vendor_bloc.dart';

class VendorServicesTab extends StatelessWidget {
  VendorBloc bloc;
  VendorServicesTab(this.bloc);
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: baseText("الخدمات", color: Colors.white),
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
                              state.services != null &&
                                      state.services.isNotEmpty
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
                                              state.services.length, (index) {
                                            return ServiceItem(
                                              state.services[index],
                                            );
                                          })))
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      if (state.isLoading)
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
