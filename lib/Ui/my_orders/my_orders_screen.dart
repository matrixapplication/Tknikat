import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/Ui/my_orders/product_order/presentation/my_orders_product_body.dart';
import 'package:taknikat/Ui/my_orders/service_order/presentation/my_orders_service_body.dart';
import 'package:taknikat/core/extensions/extensions.dart';

import '../../core/assets_image/app_images.dart';
import '../../core/constent.dart';
import '../../core/filters/filter_class.dart';
import '../../core/style/color.dart';
import '../../core/style/styles.dart';
import '../auth_screen/page/otp/widgets/auth_header_widget.dart';

class MyOrdersScreen extends StatefulWidget {
  final bool isProvider;
  const MyOrdersScreen({super.key,required this.isProvider});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: primaryColor,
        body:
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child:
              SvgPicture.asset(AppImages.back,height: double.infinity,fit: BoxFit.cover,),
            ),
            Container(
              margin: 16.paddingAll,
              child: Column(
                children: [
                  35.height,
                  AuthHeaderWidget(
                    horizontal: 0,
                   widthEnd: 30,
                    fontSize: 20,
                    title:
                    widget.isProvider?
                    getLangLocalization('MyOrdersProvider'):
                    getLangLocalization('MyOrders'),hasLogo: false,),
                  16.height,
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          spreadRadius: 4,
                          blurRadius: 8,
                          offset: Offset(3, 5),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.black26.withOpacity(0.01),
                      ),
                    ),
                    child: TabBar(
                      indicatorColor: primaryColor,
                      dividerColor: Colors.transparent,
                      unselectedLabelStyle: TextStyles.font21SimBold.copyWith(
                        color: blackColor.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      labelStyle: TextStyles.font21SimBold.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      indicator: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(3, 4),
                          ),
                        ],
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(text: getLangLocalization("MyOrderService")),
                        Tab(text: getLangLocalization("MyOrdersProduct")),
                      ],
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                      children: [
                        MyServiceOrdersBody(isProvider: widget.isProvider,),
                        MyProductOrdersBody(isProvider: widget.isProvider)
                      ],
                    ),
                  ),


                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
