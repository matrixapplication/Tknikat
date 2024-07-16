import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';

Widget textCard(
    {name,
    isPassword,
    height = 50.0,
    keyboardType,
    textAlign = TextAlign.left,
    obscureText,
    controller,
    suffixIcon,
    prefixIcon,
    validator,
    enabled = true,
    onFieldSubmitted}) {
  return Container(
    margin: EdgeInsets.all(2),
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: new BorderSide(
            color: validator == "red" ? Colors.red : Colors.transparent),
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsetsDirectional.only(start: 10.0),
        child: Center(
          child: TextFormField(
            // validator: validator,
            obscureText: isPassword == true ? obscureText : false,
            onFieldSubmitted: onFieldSubmitted,
            keyboardType: keyboardType,
            enabled: enabled,
            //obscureText: obscureText,
            controller: controller,
            style: TextStyle(
              color: Colors.grey[600],
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
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
