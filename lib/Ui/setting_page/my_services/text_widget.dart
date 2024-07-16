import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';

Widget customTextField(
    {String? hint,
    bool isMultiline = false,
    ValueChanged<String>? onchange,
    TextEditingController? controller}) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: sizeAware.height * 0.07,
      color: Colors.grey[200],
      child: TextFormField(
        controller: controller,
        onChanged: onchange,
        minLines: isMultiline ? 5 : 1,
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: othercolor, width: 0.3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: primaryColor, width: 0.3)),
        ),
      ));
}
