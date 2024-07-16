import 'package:flutter/material.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';
import 'package:photo_view/photo_view.dart';

void openBottomSheet(BuildContext context, ImageProvider imageProvider) =>
    showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: const ContinuousRectangleBorder(),
      builder: (BuildContext context) {
        return PhotoViewGestureDetectorScope(
          axis: Axis.vertical,
          child: Stack(
            children: [
              PhotoView(
                backgroundDecoration: BoxDecoration(
                  color: Colors.grey.withAlpha(240),
                ),
                imageProvider: imageProvider,
                heroAttributes:
                    PhotoViewHeroAttributes(tag: imageProvider.toString()),
              ),
              Positioned(
                top: 40,
                right: 40,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    child: Icon(
                      Icons.close,
                      color: primaryColor,
                      size: sizeAware.width * 0.1,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
