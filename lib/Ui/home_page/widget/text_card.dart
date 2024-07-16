import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';

Widget textCard(
    {name,
    isPassword,
    height,
    width,
    textAlign = TextAlign.left,
    obscureText,
    controller,
    suffixIcon,
    prefixIcon,
    FormFieldValidator<String>? validator,
    Function? onChange}) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    ),
    child: Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        validator: validator,
        obscureText: isPassword == true ? obscureText : false,

        keyboardType: TextInputType.text,
        //obscureText: obscureText,
        controller: controller,
        style: TextStyle(
          color: primaryColor,
        ),

        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: name,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(color: primaryColor, fontSize: 12),
          labelStyle:
              TextStyle(fontWeight: FontWeight.normal, color: primaryColor),
        ),
      ),
    ),
  );
}
