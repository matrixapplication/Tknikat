
import 'package:flutter/cupertino.dart';
import '../../style/color.dart';
import '../../style/styles.dart';



class HintBoldText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;

  const HintBoldText({
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
          TextStyles.font21Bold.copyWith(fontSize: fontSize ?? 21, color: labelColor??grayColor,),
    );
  }
}

class HintRegularText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;
  final int? maxLines;

  const HintRegularText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.labelStyle,
    this.labelColor,
    this.fontSize, this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines?? 2,
      style: labelStyle ??
          TextStyles.font16Regular.copyWith(fontSize: fontSize ?? 16, color: labelColor??grayColor),
    );
  }
}

class HintMediumText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? style;
  final Color? labelColor;
  final double? fontSize;
  final int? maxLines;

  const HintMediumText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.style,
    this.labelColor,
    this.fontSize, this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        label,
        textAlign: textAlign,
        maxLines: maxLines?? 2,
        style: style ??
            TextStyles.font18Mid.copyWith(fontSize: fontSize ?? 18, color: labelColor??grayColor),
      ),
    );
  }
}

class HintSemiBoldText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? style;
  final Color? labelColor;
  final double? fontSize;

  const HintSemiBoldText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.style,
    this.labelColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: style ??
          TextStyles.font21SimBold.copyWith(fontSize: fontSize ?? 21, color: labelColor??grayColor),
    );
  }
}