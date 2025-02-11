import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taknikat/core/constent.dart';

import '../widgets/custom_loading_spinner.dart';

Widget loader({context}) {
  return listLoader(context: context);
  // SpinKitFadingFour(
  //   color: primaryColor,
  //   size: 25.0,
  // );
}

Widget listLoader({context}) {
  return
    // CustomLoadingSpinner();
    SpinKitThreeBounce(
    color: primaryColor,
    size: 30.0,
  );
}
