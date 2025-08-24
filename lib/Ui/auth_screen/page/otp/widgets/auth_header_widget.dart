import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';

import '../../../../../core/widgets/custom_logo.dart';
import '../../../../../core/widgets/icon_widget.dart';
import '../../../../../core/widgets/texts/black_texts.dart';


class AuthHeaderWidget extends StatelessWidget {
  final String? title;
  final bool? hasLogo;
  final bool? hasFilter;
  final double? horizontal ;
  final double? widthEnd ;
  final double? fontSize ;
  final void Function()? onTapFilter;
  const AuthHeaderWidget({Key? key, this.fontSize,this.title,this.hasLogo=true, this.hasFilter=false, this.onTapFilter, this.horizontal, this.widthEnd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconWidget(
          margin: EdgeInsets.symmetric(horizontal:horizontal?? 20.w),
          onTap: ()=>context.pop(),
        ),
       Expanded(child:  Column(
         children: [
           30.height,
           BlackMediumText(label: title??'',fontSize:fontSize??16 ,),
         ],
       ),)  ,
        if(hasLogo==true)
        Padding(padding: 10.paddingAll,
        child:
    hasFilter==true?
        IconWidget(
          onTap: onTapFilter,
          height: 40.h,
          width: 40.h,
          widget:Container(
            padding: 10.paddingAll,
            child: SvgPicture.asset(AppImages.filter),
          ) ,
        ):
        CustomLogo(
          fit: BoxFit.contain,
          height: 40.h,
          width: 90.w,
        ),
        )else

          widthEnd?.width??90.width,

      ],
    );
  }
}
