import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/pop_up_post_list.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_screen/bottom_post_widget.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_screen/post_screen.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_user_info.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/injectoin.dart';

import '../../../../core/app_localizations.dart';
import '../post_images_widget.dart';

class PostItem extends StatelessWidget {
  final int index;
  final bool fromMyPostsList;

  const PostItem({required this.index, required this.fromMyPostsList});

  @override
  Widget build(BuildContext context) {
    final post = fromMyPostsList
        ? sl<PostsBloc>().state.myPosts[index]
        : sl<PostsBloc>().state.posts[index];

    return
      Container(
      margin: 6.paddingVert,
      padding: 12.paddingAll,
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
       boxShadow:  [
         BoxShadow(
           color: Colors.black.withOpacity(0.02),
           blurRadius: 10,
           offset: Offset(2,5)
         )
       ]
      ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(PageTransition(
                        duration: Duration(milliseconds: 1000),
                        type: PageTransitionType.fade,
                        child: PostScreen(
                          index: index,
                          fromMyPostsList: fromMyPostsList,
                        )));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Expanded(
                            child: PostUserInfo(context, post.user ?? appUser!,
                                postCreatedDated: post.createdAt!),
                          ),
                          PopUpPostMenu(
                            post: post,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: ReadMoreText(
                          post.description!,
                          trimLines: 2,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey, height: 1.4),
                          colorClickableText: Colors.blue,
                          trimCollapsedText: AppLocalizations.of(context)
                            .translate("see more2"),
                          trimExpandedText:AppLocalizations.of(context)
                              .translate("see less2"),
                        ),
                      ),
                      // Text('    data : $index    '),

                      SizedBox(height: 10),
                      PostImagesWidget(post: post),
                    ],
                  ),
                ),
                BottomPostWidget(post: post),
              ],
            ),
          ],
        ));
  }
}
