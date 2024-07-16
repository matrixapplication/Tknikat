import 'package:flutter/material.dart';

Widget baseText(String translate,
    {size, color, textAlign, decoration, fontWeight}) {
  return Text(
    translate,
    softWrap: true,
    textAlign: textAlign,
    style: TextStyle(
        fontSize: size,
        decoration: decoration,
        fontWeight: fontWeight,
        color: color),
  );
}
