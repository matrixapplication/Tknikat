import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taknikat/core/constent.dart';

void showToast(String? message) {
  if (message?.isNotEmpty ?? false) {
    Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        // timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[200],
        textColor: primaryColor,
        fontSize: 16.0);
  }
}
