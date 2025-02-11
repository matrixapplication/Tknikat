
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';

import 'base_form.dart';



class CustomTextFieldLink extends StatelessWidget {
  final String? suffixText;
  final String? hint;
  final String? defaultValue;
  final String? label;
  final String? iconSVG;

  final bool readOnly;
  final bool isHorizontal;
  final bool autoValidate;
  final bool noBorder;
  final bool isRequired;
  final bool autofocus;
  final bool enable;

  final int? lines;
  final int? maxLength;

  final double? fontSize;
  final double? radius;
  final double? contentPaddingH;

  final List<TextInputFormatter>? formatter;

  final Widget? icon;
  final Widget? prefixWidget;
  final Widget? suffixData;

  final IconData? iconData;
  final IconData? suffixIconData;

  final Color? background;

  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  final Function? validateFunc;
  final Function? onSubmit;

  final TextEditingController? controller;
  final TextInputAction? textInputAction;

   const CustomTextFieldLink({
    Key? key,
    this.suffixText,
    this.hint,
    this.defaultValue,
    this.label,
    this.iconSVG,
    this.isHorizontal = false,
    this.autoValidate = false,
    this.readOnly = false,
    this.noBorder = false,
    this.isRequired = true,
    this.autofocus = false,
    this.enable = true,
    this.lines,
    this.maxLength,
    this.fontSize,
    this.radius,
    this.contentPaddingH,
    this.formatter,
    this.icon,
    this.prefixWidget,
    this.suffixData,
    this.iconData,
    this.suffixIconData,
    this.background,
    this.onTap,
    this.onChange,
    this.validateFunc,
    this.onSubmit,
    this.controller,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(

      background: background,
      icon: icon,
      prefixIcon: iconData,
      prefixWidget:prefixWidget??(iconSVG==null?null: SizedBox(height: 30.r,width: 30.r,child: Center(child:SvgPicture.asset(iconSVG!  )))),
      // startWidget:prefixWidget??(iconSVG==null?null: SizedBox(height: 20.r,width: 20.r,child: Center(child:CustomSVGIcon(iconSVG!,color:enable?Theme.of(context).primaryColor:Theme.of(context).hintColor)  ))),
      // prefixWidget:prefixWidget??CustomInputIcon(Assets.svgEmailIcon),
      suffixMaxWidth: 60,
      prefixMaxWidth: 70,
      isHorizontal: isHorizontal,
      defaultValue: defaultValue,
      hint: hint,
      onTap: onTap,
      maxLength: maxLength,
      readOnly: readOnly,
      autoValidate: autoValidate,
      enable: enable,
      noBorder: noBorder,
      isRequired: isRequired,
      label: label,
      contentPaddingH: contentPaddingH,
      lines: lines,
      fontSize: fontSize,
      radius: radius,
      onChange: onChange,
      suffixIconData: suffixIconData,
      suffixText: suffixText,
      formatter: formatter,
      type: TextInputType.text,
      controller: controller ?? TextEditingController(),
      suffixData: suffixData,
      onSubmit: onSubmit,
      autofocus: autofocus,
      textInputAction: textInputAction,
      validateFunc: validateFunc ??
              (value) {
            // bool validURL =  Uri.tryParse(value)?.hasAbsolutePath ?? false;
            bool validURL = Uri.parse(value).isAbsolute;

            if (!validURL) {
              return 'Please Enter Valid URL';
            }
            return null;
          },

    );
  }
}
