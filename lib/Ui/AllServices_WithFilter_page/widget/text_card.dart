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
  return Padding(
    padding: const EdgeInsets.only(top: 0.0, left: 0, right: 0),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8),
        child: Container(
          width: width,
          height: height,
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
              contentPadding: EdgeInsets.all(15),
              border: InputBorder.none,
              hintText: name,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(color: primaryColor, fontSize: 12),
              labelStyle: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                  color: primaryColor),
            ),
          ),
        ),
      ),
    ),
  );
}
