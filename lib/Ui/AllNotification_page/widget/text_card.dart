import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';

Widget textCard(
    {image,
    name,
    hintText,
    isPassword,
    isLocation,
    height,
    keyboardType,
    textAlign = TextAlign.left,
    controller,
    Function? onChange,
    Color? color,
    double? borderRadius,
      String? Function(String?)? validator
    }) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Card(
        color: color??Colors.white70,
        elevation: 0,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(00)),
          ),
          child: Center(
            child: TextFormField(
              keyboardType: keyboardType,
              autofocus: false,
              controller: controller,
              obscureText: isPassword,
              validator: validator,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontFamily: "Tajawal", color: Colors.grey),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius??25.0),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius??25.0),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
        )),
  );
}
