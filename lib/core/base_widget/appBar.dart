import 'package:flutter/material.dart';

PreferredSizeWidget appBar(
    {context,
    title,
    size,
    color,
    fontFamily,
    textAlign,
    decoration,
    fontWeight,
    leading}) {
  return AppBar(
    automaticallyImplyLeading: false, // Used for removing back buttoon.
    titleSpacing: 0.0,

    title: title,
    centerTitle: true,
    leading: leading,
    backgroundColor: Colors.white,
    actions: <Widget>[
      RotatedBox(
          quarterTurns: 2,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          )

          //  onPressed: null,
          )
    ],
  );
}
