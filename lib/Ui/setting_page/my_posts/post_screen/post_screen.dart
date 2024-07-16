import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'package:taknikat/Ui/setting_page/my_posts/add_sub_post_screen.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_state.dart';
import 'package:taknikat/Ui/setting_page/my_posts/pop_up_post_list.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_screen/bottom_post_widget.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_user_info.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/post_model/post_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';

import '../post_images_widget.dart';
import '../sub_post_item.dart';

class PostScreen extends StatelessWidget {
  final int? index;
  final bool fromMyPostsList;
  final PostModel? postModel;

  const PostScreen(
      {Key? key, this.index, required this.fromMyPostsList, this.postModel})
      : assert(postModel != null || index != null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<PostsBloc>(),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          final post = postModel ??
              (fromMyPostsList ? state.myPosts[index!] : state.posts[index!]);
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              toolbarHeight: 80,
              backgroundColor: primaryColor,
              title: Text(userName(post.user),
                  style: TextStyle(color: Colors.white)),
              centerTitle: true,
              titleSpacing: 4,
              elevation: 0,
            ),
            body: SafeArea(
                child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  children: [
                    _PostItem(post: post),
                    if (post.subPosts?.isNotEmpty ?? false)
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 32.0),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('منشورات أخرى',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor)),
                            ),
                            ...List.generate(
                                post.subPosts!.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: SubPostItem(
                                        post: post.subPosts![index],
                                      ),
                                    )),
                          ]),
                    if ((post.subPosts?.length ?? 0) < 6 && post.isMyPost)
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xffd5e7f5),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(PageTransition(
                                  duration: Duration(milliseconds: 700),
                                  type: PageTransitionType.fade,
                                  child: AddSubPostScreen(parentId: post.id)));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/add.svg"),
                                SizedBox(height: 15),
                                Text(
                                  'ارفاق منشور فرعي',
                                  style: TextStyle(
                                      fontSize: 16, color: primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                if (state.isLoading)
                  Center(
                    child: loader(context: context),
                  ),
              ],
            )),
          );
        },
      ),
    );
  }

  String userName(UserModel? user) {
    if (user != null) return user.firstName! + ' ' + user.lastName!;
    return appUser!.firstName! + ' ' + appUser!.lastName!;
  }
}

//The main post widget when open it from postScreen
class _PostItem extends StatelessWidget {
  final PostModel post;

  const _PostItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: PostUserInfo(context, post.user ?? appUser!,
                          postCreatedDated: post.createdAt!)),
                  PopUpPostMenu(
                    popUpWhenRemove: true,
                    post: post,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ReadMoreText(
                  post.description!,
                  trimLines: 2,
                  textAlign: TextAlign.start,
                  style:
                      TextStyle(fontSize: 14, color: Colors.grey, height: 1.4),
                  colorClickableText: Colors.blue,
                  trimCollapsedText: 'عرض المزيد',
                  trimExpandedText: 'عرض القليل',
                ),
              ),
              SizedBox(height: 10),
              PostImagesWidget(post: post, canShowImage: true),
              BottomPostWidget(post: post),
            ],
          ),
        ],
      ),
    );
  }
}
