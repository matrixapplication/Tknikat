import 'package:flutter/material.dart';

import '../../core/constent.dart';
import '../../injectoin.dart';
import '../gallery/gallery_category/gallary_category_screen.dart';
import '../gallery/gallery_screen.dart';
import '../setting_page/bloc/settings_bloc.dart';
import '../setting_page/my_events/my_events_page.dart';
import '../setting_page/my_products/my_products_page.dart';
import '../setting_page/my_projects/my_projects_page.dart';
import '../setting_page/my_services/my_services_page.dart';

class MenuScreen extends StatelessWidget {
   MenuScreen({Key? key}) : super(key: key);
  final _bloc = sl<SettingsBloc>();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:
     SingleChildScrollView(
       child:    Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           SizedBox(height: 10,),
           FittedBox(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 MenuItem(context: context, icon: Icons.developer_board_sharp, onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => MyProductsPage()));
                 }),
                 SizedBox(width: 20,),
                 MenuItem(context: context, icon: Icons.message_outlined, onTap: (){}),
               ],
             ),
           ),
           FittedBox(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 MenuItem(context: context, icon: Icons.card_travel, onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) => MyServicesPage()));
                 }),
                 SizedBox(width: 20,),
                 MenuItem(context: context, icon: Icons.calendar_month_outlined, onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                     builder: (context) => MyEventsPage(),
                   ));

                 }),
               ],
             ),
           ),
           FittedBox(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 MenuItem(context: context, icon: Icons.video_library_outlined, onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                     builder: (context) => MyProjectsPage(),
                   ));
                 }),
                 SizedBox(width: 20,),
                 MenuItem(context: context, icon: Icons.photo_library_sharp, onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                     builder: (context) => GalleryCategoryScreen(),
                   ));
                 }),
               ],
             ),
           ),
           SizedBox(height: 10,),

         ],
       ),
     )
      ),
    );
  }
}
Widget MenuItem({double? width,void Function()? onTap,double? height,required BuildContext context,required IconData icon}){
  return Container(
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: height??160,
        width:  width??MediaQuery.sizeOf(context).width/2.3,
          margin: EdgeInsets.symmetric(vertical: 16),
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16)+EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child:
        Icon(icon,size: 100,color: Colors.white,),
      ),
    ),
  );
}