import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/filters/filter_class.dart';
import '../AllProducts_WithFilter_page/all_products_page.dart';
import '../AllServices_WithFilter_page/all_services_page.dart';
import '../all_events_page/all_events_page.dart';
import 'menu_screen.dart';
import '../services_page/services_page.dart';
import '../setting_page/my_events/my_events_page.dart';
import '../setting_page/my_products/my_products_page.dart';
import '../setting_page/my_projects/my_projects_page.dart';
import '../setting_page/my_services/my_services_page.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150,),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuItem(
                      height: 160,
                      context: context, icon: Icons.developer_board_sharp, onTap: (){
                    Navigator.of(context).push(
                        PageTransition(
                            duration:
                            Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: AllEventPage()));
                  }),
                  SizedBox(width: 20,),
                  MenuItem(
                      height: 160,
                      context: context, icon: Icons.calendar_month_outlined, onTap: (){
                    Navigator.of(context).push(
                        PageTransition(
                            duration: Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: AllProductsPage(
                              custom_filter:
                              CustomFilter(search: ""),
                              title: '',
                            )));
                  }),
                ],
              ),
            ),
            SizedBox(height: 20,),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuItem(
                      height: 160,
                      context: context, icon: Icons.shopping_cart_outlined, onTap: (){

                  }),
                  SizedBox(width: 20,),
                  MenuItem(
                      height: 160,
                      context: context, icon: Icons.card_travel, onTap: (){
                    Navigator.of(context).push(
                        PageTransition(
                            duration:
                            Duration(milliseconds: 700),
                            type: PageTransitionType.fade,
                            child: AllServicesPage(
                              custom_filter:
                              CustomFilter(search: ""),
                            )));

                  }),
                ],
              ),
            ),
            SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}
