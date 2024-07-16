import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';

Widget textCard(
    {name,
    isPassword,
    height,
    textAlign = TextAlign.left,
    obscureText,
    controller,
    suffixIcon,
    prefixIcon,
    initialValue,
    enabled,
    maxLines,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChange}) {
  return Padding(
    padding: const EdgeInsets.only(top: 0.0, left: 0, right: 0),
    child: Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: TextFormField(
            enabled: enabled,
            validator: validator,
            onChanged: onChange,
            maxLines: maxLines,
            initialValue: initialValue,
            obscureText: isPassword == true ? obscureText : false,

            keyboardType: TextInputType.text,
            //obscureText: obscureText,
            controller: controller,
            style: TextStyle(
              color: Colors.grey,
            ),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsetsDirectional.only(start: 5, bottom: 12.5),
              border: InputBorder.none,
              hintText: name,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(
                color: Colors.grey[500],
              ),
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
