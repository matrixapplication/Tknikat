import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';

class BackButtonArrowLeft extends StatelessWidget {
  final double? top;
  final double? left;

  BackButtonArrowLeft({this.top, this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top:top?? 60,
        left: left??40,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 0.2, color: primaryColor)),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: 30,
              color: primaryColor,
            ),
          ),
        ));
  }
}

class BackButtonArrowRight extends StatelessWidget {
  final double? top;
  final double? right;
  BackButtonArrowRight({this.top, this.right});
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top??60,
        right:right?? 40,
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 0.2, color: primaryColor)),
            child: RotatedBox(
              quarterTurns: 2,
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 30,
                color: primaryColor,
              ),
            ),
          ),
        ));
  }
}
