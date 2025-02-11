import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/widgets/tap_effect.dart';

class IconWidget extends StatelessWidget {
  final void Function()? onTap;
  final double? width;
  final Color? color;
  final double? radius;
  final double? height;
  final Widget? widget;
  final double? padding;
  final IconData? icon;
  final EdgeInsets? margin;
  const IconWidget({this.onTap,this.padding, this.width, this.height, this.color, this.widget, this.icon,  this.margin, this.radius,});

  @override
  Widget build(BuildContext context) {
    return CustomTapEffect(
      onTap: onTap,
      // splashColor: Colors.grey.withOpacity(0.08),
      // highlightColor: Colors.grey.withOpacity(0.08),
      child:Container(
        margin: margin??EdgeInsets.symmetric(horizontal: 5.w),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color?? Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.02),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(4,6),
            ),
          ],
          borderRadius: BorderRadius.circular(radius??10.w),
        ),
        child:
        widget!=null?
        Padding(
          padding: padding!=null?padding!.paddingAll:0.paddingAll,
          child: widget,
        ):
        Padding(padding: padding!=null?padding!.paddingAll:8.paddingAll,
        child:  Icon(icon??Icons.arrow_back, color: Colors.black,),
        )
      ),
    );
  }
}
