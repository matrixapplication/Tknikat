import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/Ui/layout/widgets/bottom_bar_item.dart';
import 'package:taknikat/core/constent.dart';

import '../../../core/assets_image/app_images.dart';
import '../../../core/filters/filter_class.dart';

class CustomBottomBar extends StatefulWidget {
  final Function(int index) onChange;
  const CustomBottomBar({Key? key, required this.onChange}) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int index =0;
  @override
  Widget build(BuildContext context) {
    return
     Stack(
       children: [
         Container(
         height: 90,
         width: MediaQuery.sizeOf(context).width,
         alignment: Alignment.bottomCenter,
         color: Colors.transparent,
         child: Container(
           height: 60,
           padding: EdgeInsets.only(top: 5),
           color: Colors.white,
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.end,
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             mainAxisSize: MainAxisSize.max,

             children: [


               BottomBarItem(
                   isSelected: index==0,
                   title: getLangLocalization('Home'), image: AppImages.home, onChange: (int value){
                 setState(() {
                   index =value;
                   widget.onChange.call(index);

                 });
               }, index: 0),
               BottomBarItem(
                   isSelected: index==1,
                   title: getLangLocalization('Profile'), image: AppImages.profile, onChange: (int value){
                 setState(() {
                   index =value;
                   widget.onChange.call(index);
                 });
               }, index: 1),
             ],
           ),
         )),
         Positioned(
           top: 0,
           left: 0,
           right: 0,
           child: Align(
             alignment: Alignment.topCenter,
             child:
             InkWell(
               onTap: (){
                 setState(() {
                   // index =1;
                   // widget.onChange.call(index);

                 });
               },
               child: Container(
                 padding: EdgeInsets.all(4),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(50),
                 ),
                 child:
                 Container(
                   height: 60,
                   width: 60,
                   margin: EdgeInsets.all(2),
                   padding: EdgeInsets.all(15),
                   decoration: BoxDecoration(
                     color:Colors.white,
                     // primaryColor,
                     borderRadius: BorderRadius.circular(50),
                   ),
                   // child: SvgPicture.asset(AppImages.category),
                 ),
               ),
             )
           ),
         ),
       ],
     );
  }
}

