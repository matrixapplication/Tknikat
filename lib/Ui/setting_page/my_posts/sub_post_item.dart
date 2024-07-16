import 'package:flutter/material.dart';
import 'package:taknikat/Ui/setting_page/my_posts/pop_up_sub_post_list.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_images_widget.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/model/post_model/post_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class SubPostItem extends StatelessWidget {
  final PostModel post;

  SubPostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        8.0,
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              timeago.format(
                DateTime.parse(
                  post.createdAt!,
                ),
                locale: AppLocalizations.of(context).locale.languageCode,
              ),
              style: TextStyle(fontSize: 12, color: Color(0xFF898E92))),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              post.description ?? '',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: 10),
          PostImagesWidget(post: post),
        ],
      ),
    );
  }
}
