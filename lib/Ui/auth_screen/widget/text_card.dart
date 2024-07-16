import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';

Widget textCard({
  name,
  isPassword,
  height = 50.0,
  keyboardType,
  textAlign = TextAlign.left,
  obscureText,
  controller,
  suffixIcon,
  prefixIcon,
  onFieldSubmitted,
  onChanged,
  FormFieldValidator<String>? validator,

}) {
  return Container(
    margin: EdgeInsets.all(2),
    child: Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 10.0),
        child: Center(
          child: TextFormField(
             validator: validator,
            obscureText: isPassword == true ? obscureText : false,
            onFieldSubmitted: onFieldSubmitted,
            keyboardType: keyboardType,
//obscureText: obscureText,
            controller: controller,
            style: TextStyle(
              color: Colors.grey[600],
            ),
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              hintText: name,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 12),
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
