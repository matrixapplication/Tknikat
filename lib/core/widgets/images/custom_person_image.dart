import 'dart:io';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/extensions/num_extensions.dart';

import '../../assets_image/app_images.dart';
import '../../utils/attach_image.dart';
import '../../utils/validators.dart';



class CustomPersonImage extends StatelessWidget {
  final String? _imageUrl;
  final String? _avatar;
  final double _borderSize;
  final double _size;
  final bool _showShadow;
  final Function(String path)? _onAttachImage;

   CustomPersonImage({
    String? imageUrl,
    String? avatar,
    double borderSize = 4,
    double size = 100,
    bool showShadow = true,
    Function(String path)? onAttachImage,
  })  : _imageUrl = imageUrl,
        _avatar = avatar,
        _borderSize = borderSize,
        _size = size,
        _showShadow = showShadow,
        _onAttachImage = onAttachImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: _size.r,
            height: _size.r,
            decoration: BoxDecoration(
              // border: Border.all(width: _borderSize, color: Theme.of(context).scaffoldBackgroundColor),
              boxShadow:_showShadow? [
                   BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 10),
                )
              ]:null,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: (_imageUrl ?? '' ).isEmpty
                  ? _buildPlaceholder()
                  : _imageUrl!.endsWith('.svg')
                  ? SvgPicture.network(_imageUrl! ,width:  _size.r , height:  _size.r )
                  : _imageUrl!.contains('assets/images/')
                  ? Image.asset(_imageUrl! ,width: _size.r , height:  _size.r )
                  : !Validators2.isURL(_imageUrl)
                  ? Image.file(File(_imageUrl!), width:  _size.r , height:  _size.r , fit: BoxFit.fill)
                  : CachedNetworkImage(
                placeholder: (ctx, url) => _buildPlaceholder(),
                width:  _size.r ,
                height:  _size.r ,
                fit: BoxFit.cover,
                imageUrl: _imageUrl ?? '',
                errorWidget: (c, o, s) => _buildPlaceholder(),
              ),
            ),
          ),
          if (_onAttachImage != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                padding: 5.paddingAll,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor,),
                  color: Colors.white,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      String? path = await onPickImagesPressed(context);
                      if (path != null && _onAttachImage != null) {_onAttachImage!(path);}
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: SvgPicture.asset(AppImages.image)
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
  _buildPlaceholder(){
    return
      CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset(AppImages.person,
          width: _size.r,
          height:_size.r,
          fit: BoxFit.cover,
        ),
      );
  }
}
