import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taknikat/core/constent.dart';

import '../widgets/custom_loading_spinner.dart';

Widget loader({context,Color? color}) {
  return listLoader(context: context,color: color);
  // SpinKitFadingFour(
  //   color: primaryColor,
  //   size: 25.0,
  // );
}

Widget listLoader({context,Color? color}) {
  return
    // CustomLoadingSpinner();
    SpinKitThreeBounce(
    color:color?? primaryColor,
    size: 30.0,
  );
}
