import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taknikat/core/constent.dart';

import '../../core/assets_image/app_images.dart';
import '../../core/widgets/icon_widget.dart';

class ShareWidget extends StatelessWidget {
  final String path;

  const ShareWidget({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(url + path);
    return

      IconWidget(
        onTap: (){
          Share.share(url + path);
        },
        padding: 12,
        widget: SvgPicture.asset(AppImages.share),
      );
  }
}
