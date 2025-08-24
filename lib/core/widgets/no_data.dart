import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';
import 'package:taknikat/core/widgets/texts/hint_texts.dart';

import '../filters/filter_class.dart';



class CustomNoDataView extends StatelessWidget {
  final String?  _title;
  final String? _desc;
  final String? _image;
  final String _imageSvg;
  final double _padding;

  const CustomNoDataView({
    String? title ,
    String? desc,
    String? image,
    double padding = 12,

    String imageSvg=AppImages.noFoundData,
  })  : _title = title,
        _padding = padding,
        _desc = desc,
        _image = image,
        _imageSvg = imageSvg;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.all(_padding.r),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center, children: [
           (_image != null)? Image.asset(_image!) : SvgPicture.asset(_imageSvg, width: 200.w, height: 200.h, fit: BoxFit.fill),
          12.width,
          BlackRegularText(label: _title??
              getLangLocalization("not found data")
             ),
          12.width,
          HintRegularText(label: _desc??'',fontSize: 12,),

          ],
        ),
      ),
    );
  }
}
