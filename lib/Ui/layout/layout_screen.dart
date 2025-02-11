import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taknikat/Ui/layout/widgets/custom_bottom_bar.dart';

import '../../injectoin.dart';
import '../AllCategories_page/allCategories.dart';
import '../base_page/navigation_bar_provider.dart';
import '../home_page/bloc/home_bloc.dart';
import '../home_page/page/home_page.dart';
import '../setting_page/my_posts/wall_page.dart';
import '../setting_page/profile_page.dart';

class LayOutScreen extends StatefulWidget {

  @override
  State<LayOutScreen> createState() => _LayOutScreenState();
}

class _LayOutScreenState extends State<LayOutScreen> {
  int index =1;
  List<Widget> pages = [
    // WallPage(),
    HomePage(),
    AllCategoriesPage(),
    ProfilePage(),
    // MyCart(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _bloc = sl<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: pages[index],
        bottomNavigationBar: CustomBottomBar(onChange: (int value){
          setState(() {
            index=value;
          });
        },),
      );
  }
}