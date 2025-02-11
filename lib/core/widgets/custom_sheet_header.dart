
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/widgets/icon_widget.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';



class CustomSheetHeader extends StatelessWidget {
  final VoidCallback _onCancelPress;

  final String _title;
  const CustomSheetHeader({
    required VoidCallback onCancelPress,
    required String title,
  })  : _onCancelPress = onCancelPress,
        _title = title;
  @override
  Widget build(BuildContext context) {
    return   Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child:
          BlackMediumText(label: _title,)

        ),
        12.width,
        IconWidget(
          padding: 10,
          onTap: _onCancelPress,
          widget: Container(
            child: SvgPicture.asset(AppImages.exit),
          ),
        )

      ],
    );
  }


}
