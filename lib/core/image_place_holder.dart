import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ImagePlaceholder extends StatelessWidget {
  double width = double.infinity,
      height = double.infinity,
      radius = double.infinity;
  bool _is_circular = false;
  BorderRadius? borderRadius;
  static const Color whiteColor = Color(0xffaaaaaa);
  static const Color secondaryColor = Colors.grey;
  ImagePlaceholder._();
  ImagePlaceholder.rectangular(
      {this.width = double.infinity,
      this.height = double.infinity,
      this.borderRadius}) {
    _is_circular = false;
  }

  ImagePlaceholder.circular({this.radius = double.infinity}) {
    _is_circular = true;
  }
  @override
  Widget build(BuildContext context) {
    if (_is_circular)
      return Shimmer.fromColors(
          baseColor: whiteColor,
          highlightColor: secondaryColor,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: whiteColor,
          ));
    else if (borderRadius != null)
      return Shimmer.fromColors(
        baseColor: whiteColor,
        highlightColor: secondaryColor,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: borderRadius,
          ),
        ),
      );
    else
      return Shimmer.fromColors(
        baseColor: whiteColor,
        highlightColor: secondaryColor,
        child: Container(
          height: height,
          width: width,
        ),
      );
  }
}
