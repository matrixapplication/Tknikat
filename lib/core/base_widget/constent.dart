import 'package:flutter/material.dart';

const String IS_LOGIN = "login";

const String TOKEN = "token";

const String APP_CURRENCY = "app_currency";
const String APP_LANGUAGE = "App_language";

const String NOTIFI = "notification";
const String FAVORITE = "favorite";
const String CART = "cart";
const String APPUSER = "user";

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
