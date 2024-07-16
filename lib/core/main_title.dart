import 'package:flutter/material.dart';

import 'constent.dart';

class MainTitle extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final double height;

  const MainTitle(this.title, {this.height = 21, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsetsDirectional.only(top: 13, end: 13),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: primaryColor,
          width: 2.0,
        )),
      ),
      child: FittedBox(
        child: Text(
          title,
          style: style ?? mainTitle,
        ),
      ),
    );
  }
}
