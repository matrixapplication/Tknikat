import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';

class ProfileItemWidget extends StatelessWidget {
  final String image;
  final bool selected;
  final void Function()? onTap;
  const ProfileItemWidget({Key? key, required this.image, this.onTap, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Expanded(

          // height: 50,
          // width: 50,

        child:
      Container(
        padding: 5.paddingAll+4.paddingHorizontal,
        child: InkWell(
          onTap:onTap,
          child: Column(
            children: [
              8.height,
              SvgPicture.asset(image,color: selected?primaryColor:null),
              8.height,
              if(selected)
                Container(
                  height: 2,
                  color: primaryColor,
                )
            ],
          ),
        ),
      )
      );
  }
}
