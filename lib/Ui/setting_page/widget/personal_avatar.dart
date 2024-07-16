import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/injectoin.dart';

class PersonalAvatar extends StatelessWidget {
  final double? radius;
  const PersonalAvatar({Key? key, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius ?? 30,
      child: CachedNetworkImage(
        placeholderFadeInDuration: Duration(seconds: 1),
        errorWidget: (context, url, error) => CircleAvatar(
          backgroundColor: Colors.white,
          child: FittedBox(
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        placeholder: (_, __) => ImagePlaceholder.circular(),
        imageUrl: getImagePath(appUser?.avatar ?? ''),
        imageBuilder: (context, imageProvider) => CircleAvatar(
          backgroundImage: imageProvider,
          radius: radius ?? 30,
        ),
      ),
    );
  }
}
