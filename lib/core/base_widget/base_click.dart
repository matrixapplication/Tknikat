import 'package:flutter/material.dart';

Widget baseClick(String title,
    {Function? onTap,
    double? height,
    double? width,
    Color? color,
    icon,
    icons,
    Color? borderColor,
    colorclick,
    FontWeight,
    double radius = 4.0,
    double? sizeTitle,
    Color colorTitle = Colors.white}) {
  return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(
                color: borderColor == null ? Colors.transparent : borderColor),
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      icons == true
                          ? Row(
                              children: [
                                Image.asset(
                                  icon,
                                  width: 15,
                                  height: 15,
                                  color: colorclick,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                              ],
                            )
                          : Container(),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: sizeTitle,
                            fontWeight: FontWeight,
                            color: colorTitle),
                      ),
                    ])
              ]),
        ),
      ));
}
