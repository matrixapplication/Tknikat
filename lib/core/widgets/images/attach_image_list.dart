import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:taknikat/core/assets_image/app_images.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';
import 'package:taknikat/core/style/styles.dart';
import 'package:taknikat/core/widgets/texts/black_texts.dart';


import '../../constent.dart';
import '../../image.dart';
import '../../utils/validators.dart';
import 'item_picked_image.dart';

class AttachImageListView extends StatelessWidget {
  final _tag = 'AttachImageListView';
  final List<File> selectedImages;
  final List<String>? imagesNetwork;

  final String title;
  final String? error;


  final double height;

  final ValueChanged<String>? onRemoveImage; // For network images
  final ValueChanged<File> onRemoveSelectedImage;

  final Function(List<File> paths)? onAttachImage;

  const AttachImageListView(
      {Key? key,
        required this.selectedImages,
        this.title = '',
        this.error ,
        required this.onRemoveImage,
         this.imagesNetwork,
        required this.onRemoveSelectedImage,
        this.onAttachImage,
        this.height = 170})
      : super(key: key);


 @override
  Widget build(BuildContext context) {
    return _buildPictures(context);
          }
  Widget _buildPictures(BuildContext context) {
    final bool hasImages = selectedImages.isNotEmpty || (imagesNetwork?.isNotEmpty??false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyles.font16Regular),
            if (onAttachImage != null && hasImages)
              GestureDetector(
                child: Icon(Icons.add, color: Theme.of(context).primaryColorDark, size: 20.r),
                onTap: () => onPickImagesPressed(context),
              ),
          ],
        ),
        5.height,
        hasImages
            ? _buildImageList(context)
            : _buildEmptyPictures(context, () => onPickImagesPressed(context)),
        if (error != null)
          Text(error!, style: TextStyles.font16Regular),
      ],
    );
  }

  Widget _buildImageList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Network images
          ...imagesNetwork?.map(
                (imageUrl) => Padding(
              padding: 5.paddingHorizontal,
              child: Stack(
                children: [
                  Container(
                    margin: 2.paddingAll + 3.paddingVert,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 7,
                          offset: Offset(4, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        getImagePath(imageUrl),
                        height: 100.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 8,
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Icon(Icons.clear, color: Colors.red, size: 20.r),
                      ),
                      onTap: () {
                        onRemoveImage?.call(imageUrl);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )??[],

          // Local files
          ...selectedImages.map(
                (file) => Padding(
              padding: 5.paddingHorizontal,
              child: Stack(
                children: [
                  Container(
                    margin: 2.paddingAll + 3.paddingVert,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 7,
                          offset: Offset(4, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        file,
                        height: 100.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 8,
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Icon(Icons.clear, color: Colors.red, size: 20.r),
                      ),
                      onTap: () => onRemoveSelectedImage(file),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyPictures(BuildContext context, GestureTapCallback onPickImagesPressed) {
    return GestureDetector(
      onTap: onPickImagesPressed,
      child: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xffF2F9FD),
        ),
        padding: 16.paddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.addImage5),
            8.height,
            BlackRegularText(
              label: 'Add Image',
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
          ],
        ),
      ),
    );
  }

  void onPickImagesPressed(BuildContext context) async {
    final data = await getImagesFromGallery();
    if (data != null && onAttachImage != null) {
      onAttachImage!(data);
    }
  }
}

class ImageEntity  {



  final String _image;
  final int _id;



  int get id => _id;
  String get image => _image;

  const ImageEntity({
    required String image,
    required int id,
  })
      : _image = image,
        _id = id;
}
