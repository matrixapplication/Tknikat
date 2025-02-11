import 'package:flutter/material.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';

import '../../../generated/assets.dart';

class CustomLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;
  const CustomLogo({Key? key, this.width, this.height, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.logo,
      width: width??100.h,
      height:height?? 80.h,
      fit: fit??BoxFit.contain,
    );
  }
}
