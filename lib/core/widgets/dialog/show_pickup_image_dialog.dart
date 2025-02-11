import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';

import '../../app_localizations.dart';
import '../icon_widget.dart';
import '../texts/black_texts.dart';
import 'base/simple_dialogs.dart';


Future showPickUpImageDialog({final void Function()? onTapCamera,final void Function()? onTapGallery,required BuildContext context}) async =>
    showCustomDialog(context, _buildBody(context: context,onTapCamera: onTapCamera,onTapGallery: onTapGallery), onDismissCallback: ()=>context.pop() ,isCancellable: true);


_buildBody({final void Function()? onTapCamera,final void Function()? onTapGallery,required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: StatefulBuilder(
      builder: (context, setState) {
        return Container(
          color: Colors.white,
          margin: 16.paddingHorizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconWidget(
                    onTap: ()=>Navigator.pop(context),
                    widget: Icon(
                      Icons.clear,
                      color: Colors.black,
                      size: 25.r,
                    ),
                  ),
                  BlackRegularText(
                    label:
                    AppLocalizations.of(context).translate("selectImage"),

                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  30.width,
                ],
              ),
              5.height,
              BlackRegularText(
                label:
                AppLocalizations.of(context).translate("selectImageMess"),
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: onTapCamera,
                    child: Column(
                      children: [
                        IconWidget(
                          widget: Padding(
                            padding: 8.paddingAll,
                            child: SvgPicture.asset(AppImages.image),
                          ),
                        ),
                        12.height,
                        BlackRegularText(label:
                        AppLocalizations.of(context).translate("camera"),
                          fontSize: 16,)
                      ],
                    ),
                  ),
                  32.width,
                  InkWell(
                    onTap: onTapGallery,
                    child: Column(
                      children: [
                        IconWidget(

                          widget:
                          Padding(
                            padding: 8.paddingAll,
                            child: SvgPicture.asset(AppImages.galley,height: 22.h,),
                          ),

                        ),
                        12.height,
                        BlackRegularText(label:
                        AppLocalizations.of(context).translate("gallery"),
                       fontSize: 16,)
                      ],
                    ),
                  )
                ],
              ),
              16.height,

            ],
          ),
        );
      },
    ),
  );
}
