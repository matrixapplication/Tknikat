import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/core/extensions/extensions.dart';

import '../../../core/constent.dart';
import '../../../core/widgets/icon_widget.dart';
import '../../../core/widgets/texts/black_texts.dart';

class DrawerItem extends StatelessWidget {
  final void Function() onTap;
  final String image;
  final String title;
  final Color? color;
  const DrawerItem({Key? key,required this.onTap, required this.image, required this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     Padding(padding: 6.paddingVert,
     child:  IconWidget(
         onTap:onTap,
         widget:Container(
           child:  Row(
             mainAxisAlignment:MainAxisAlignment.spaceBetween,
             mainAxisSize:MainAxisSize.max,
             children: [
               Row(
                 children: [
                   SvgPicture.asset(image,color: color??primaryColor,),
                   8.width,
                   BlackRegularText(label: title,fontSize: 16,fontWeight: FontWeight.w300,labelColor: color,),
                 ],
               ),
               Icon(Icons.arrow_forward)
             ],
           ),
           padding: 8.paddingAll+5.paddingHorizontal,
         )
     ),
     );
  }
}
