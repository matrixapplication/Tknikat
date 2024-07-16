import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_user_info.dart';
import 'package:taknikat/core/base_widget/image_viewer.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/image_place_holder.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/post_model/post_model.dart';

class PostImagesScreen extends StatelessWidget {
  final PostModel post;

  const PostImagesScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            PostUserInfo(context, post.user ?? appUser!,
                postCreatedDated: post.createdAt!),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                post.description ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
            ),
            SizedBox(height: 10),
            ...List.generate(
              post.images!.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CachedNetworkImage(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  placeholderFadeInDuration: Duration(seconds: 1),
                  errorWidget: (context, url, error) => Container(
                    alignment: Alignment.center,
                    color: othercolor,
                    child: FittedBox(
                      child: Icon(Icons.error),
                    ),
                  ),
                  placeholder: (_, __) => ImagePlaceholder.rectangular(),
                  imageUrl: getImagePath(post.images![index]),
                  imageBuilder: (context, imageProvider) => InkWell(
                    onTap: () => openBottomSheet(context, imageProvider),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: imageProvider),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
