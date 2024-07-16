import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taknikat/core/constent.dart';

Widget loader({context}) {
  return listLoader(context: context);
  // SpinKitFadingFour(
  //   color: primaryColor,
  //   size: 25.0,
  // );
}

Widget listLoader({context}) {
  return SpinKitThreeBounce(
    color: primaryColor,
    size: 30.0,
  );
}
