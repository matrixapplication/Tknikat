
import 'package:flutter/material.dart';

import 'app_localizations.dart';
import 'constent.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool? enabled;
  final int? maxLines;
  final bool? isPassword;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? validationMessage;
  final Color? hintColor;
  final String?  hintFontFamily  ;
  final void Function()? onTap  ;
  final Color? prefixIconColor;
  final double? contentHorizontalPadding;
  final double? contentVerticalPadding;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? borderColor;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? Function(String?)? validationFunc;
  final void Function(String)? onFieldSubmitted;
  final TextStyle? hintStyle;
  final void Function(String)? onChanged;
   const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.prefixIconColor,
    this.fillColor,
    this.contentHorizontalPadding,
    this.contentVerticalPadding,
    this.maxLines,
    this.hintFontFamily,
    this.onTap,
    this.validationMessage,
    this.isPassword,
    this.borderColor,
    this.fontWeight,
    this.fontSize,
    this.borderRadius,
    this.enabled,
    this.textInputType,
    this.textInputAction,
    this.validationFunc,
    this.hintStyle,
    this.hintColor,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.onChanged, this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isVisibility = false;
     if(isPassword==true){
       isVisibility=true;
     }
    return
      StatefulBuilder(builder: (context,setState){
        return
          TextFormField(
          onTap: onTap,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
          controller: controller,
          obscureText:  isVisibility,
          maxLines: maxLines ?? 1,
          decoration:
          customInputDecoration(
            fontSize: fontSize,
            fontWeight: fontWeight,
            hintStyle:hintStyle ,
            hintText: hintText,
            contentHorizontalPadding: contentHorizontalPadding,
            contentVerticalPadding: contentVerticalPadding,
            borderRadius: borderRadius,
            borderColor: borderColor,
            prefixIconColor: prefixIconColor,
            prefixIcon: prefixIcon,
            hintFontFamily: hintFontFamily,
            suffixIcon: isPassword==true ?
            IconButton(
              icon: Icon(
                isVisibility==true ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: isVisibility==true ?  Colors.grey.shade400:primaryColor,
              ),
              onPressed: () {
                isVisibility = !isVisibility;
                setState(() {});
              },
            ) :
           null,
            enabled: enabled,
            hintColor: hintColor,
            fillColor: fillColor,
          ),
          validator:validationFunc??(value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context).translate("this_field_required");
            }
            return null;
          } ,
          onSaved: (String? val) {
            controller.text = val!;
          },

          cursorWidth: 1,
          textInputAction: textInputAction ?? TextInputAction.next,
          keyboardType: textInputType ?? TextInputType.text,
          onChanged:onChanged ,
        );
      });
  }
}
InputDecoration customInputDecration({
  String? hintText,
  TextEditingController? controller,
  Icon? prefixIcon,
  Color? prefixIconColor,
  Color? fillColor,
  double? contentHorizontalPadding,
  double? contentVerticalPadding,
  int? maxLines,
  String? hintFontFamily,
  String? validationMessage,
  bool? isPassword,
  Color? borderColor,
  FontWeight? fontWeight,
  double? fontSize,
  double? borderRadius,
  bool? enabled,
  TextInputType? textInputType,
  TextInputAction? textInputAction,
  String? Function(String?)? validationFunc,
  TextStyle? hintStyle,
  Color? hintColor,
  IconButton? suffixIcon,
}) {
  bool isBorderEnabled = enabled ?? true;
  return InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor: fillColor,
    contentPadding: EdgeInsets.symmetric(
      horizontal: contentHorizontalPadding ?? 16.0,
      vertical: contentVerticalPadding ?? 12.0,
    ),
    border: isBorderEnabled ? OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? Colors.black, // Adjust the color here
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
    ) : InputBorder.none, // Use InputBorder.none when not enabled
    enabledBorder: isBorderEnabled ? OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? Colors.black, // Adjust the color here
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
    ) : InputBorder.none, // Use InputBorder.none when not enabled
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
    ),

    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
    ),
    hintStyle: hintStyle,
    prefixIcon: prefixIcon,
    prefixIconColor: prefixIconColor,
    suffixIcon: suffixIcon,
    errorStyle: TextStyle(fontSize: 12.0),
    counterText: '',
  );
}
InputDecoration customInputDecoration({
  required String hintText,
  IconButton? suffixIcon,
  double? borderRadius,
  String? hintFontFamily,
  TextStyle? hintStyle,
  Icon? prefixIcon,
  Color? hintColor,
  Color? borderColor,
  double? contentVerticalPadding,
  double? contentHorizontalPadding,
  FontWeight? fontWeight,
  double? fontSize,
  Color? fillColor,
  Color? prefixIconColor,
  bool? enabled,
}) {
  return InputDecoration(
    hintText: hintText,

    hintStyle: hintStyle??TextStyle(
      color: hintColor ?? Colors.grey,
      fontSize: fontSize ?? 12,
      fontFamily: hintFontFamily,
      fontWeight: fontWeight ?? FontWeight.w400,
    ),
    enabled: enabled ?? true,
    border:enabled == false ? OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      borderSide: BorderSide.none, // Set border color to none for testing
    ): OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      borderSide: BorderSide(color: borderColor ?? Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      borderSide: BorderSide(color: borderColor ?? Colors.grey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      borderSide: BorderSide(color: borderColor ?? Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      borderSide: BorderSide(color: borderColor ?? Colors.grey),
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8)),
    fillColor: fillColor??Colors.white,
    filled: true,
    contentPadding: EdgeInsets.symmetric(
        vertical: contentVerticalPadding ?? 5,
        horizontal: contentHorizontalPadding ?? 8),
    suffixIcon: suffixIcon != null
        ? Padding(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: (suffixIcon),
    )
        : null,
    prefixIcon: prefixIcon != null
        ? Padding(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: prefixIcon,
    )
        : null,
  );
}
