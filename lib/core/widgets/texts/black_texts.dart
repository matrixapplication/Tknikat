
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/styles.dart';




class BlackBoldText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;

  const BlackBoldText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.labelStyle,
    this.labelColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: labelStyle ??
          TextStyles.font21Bold.copyWith(fontSize: fontSize ?? 21, color: labelColor??Colors.black),
    );
  }
}

class BlackRegularText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final FontWeight? fontWeight;
  final Color? labelColor;
  final double? fontSize;
  final int? maxLines;

  const BlackRegularText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.labelStyle,
    this.labelColor,
    this.maxLines,
    this.fontSize, this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: labelStyle ??
          TextStyles.font16Regular.copyWith(fontSize: fontSize ?? 16, color: labelColor??Colors.black,fontWeight: fontWeight,),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class BlackMediumText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;
  final int maxLines;
  final TextOverflow overflow;

  const BlackMediumText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.labelStyle,
    this.labelColor,
    this.fontSize,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: labelStyle ??
          TextStyles.font18Mid.copyWith(fontSize: fontSize ?? 18, color: labelColor??Colors.black),
    );
  }
}

class BlackSemiBoldText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;

  const BlackSemiBoldText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.labelStyle,
    this.labelColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: labelStyle ??
         TextStyles.font21SimBold.copyWith(fontSize: fontSize ?? 21, color: labelColor??Colors.black),
    );
  }
}