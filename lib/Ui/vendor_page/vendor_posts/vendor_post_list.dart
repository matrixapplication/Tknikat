import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taknikat/Ui/setting_page/my_posts/add_sub_post_screen.dart';
import 'package:taknikat/Ui/setting_page/my_posts/pop_up_post_list.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_images_widget.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_screen/post_comment.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_user_info.dart';
import 'package:taknikat/Ui/setting_page/my_posts/sub_post_item.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/login_dialog.dart';
import 'package:taknikat/core/style/custom_loader.dart';
import 'package:taknikat/data/prefs_helper/prefs_helper.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/post_model/post_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';

import '../../../core/app_localizations.dart';
import '../../../injectoin.dart';
import '../../auth_screen/page/otp/widgets/auth_header_widget.dart';
import '../../setting_page/my_posts/post_screen/bottom_post_widget.dart';
import '../../setting_page/my_posts/post_screen/post_item.dart';
import 'bloc/vendor_posts_bloc.dart';
import 'bloc/vendor_posts_event.dart';
import 'bloc/vendor_posts_state.dart';

class VendorPostsList extends StatefulWidget {
  final UserModel user;
  final VendorPostBloc bloc;

  VendorPostsList(this.user, this.bloc);

  @override
  _VendorPostsListState createState() => _VendorPostsListState();
}

class _VendorPostsListState extends State<VendorPostsList> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(GetVendorPosts((b) => b..id = widget.user.id!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VendorPostBloc>.value(
      value: widget.bloc,
      child: Builder(builder: (context) {
        return BlocBuilder<VendorPostBloc, VendorPostsState>(
            builder: (BuildContext context, VendorPostsState state) {
          return Column(children: [
            if (state.isLoading)
              Center(
                child: loader(context: context),
              ),
            ...List.generate(state.posts.length,
                (index) =>

                    _PostItem(index: index, user: widget.user),),
          ]);
        });
      }),
    );
  }
}

class _PostItem extends StatelessWidget {
  final int index;
  final UserModel user;

  const _PostItem({
    required this.index,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<VendorPostBloc>();
    final post = _bloc.state.posts[index];
    return  Container(
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
                        child: _PostScreen(
                          index: index,
                          bloc: _bloc,
                          user: user,
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
                BottomPostWidget(post: post,
                onPressed: ()async{
                    if (await sl<PrefsHelper>().getIsLogin()) {
                      _bloc.add(LikePost((b) => b..id = post.id));
                    } else {
                      showLoginFirstDialog(context);
                    }
                },
                ),
              ],
            ),
          ],
        ));
    // return Container(
    //     color: Theme.of(context).scaffoldBackgroundColor,
    //     child: Stack(
    //       children: [
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             InkWell(
    //               onTap: () {
    //                 Navigator.of(context).push(PageTransition(
    //                     duration: Duration(milliseconds: 1000),
    //                     type: PageTransitionType.fade,
    //                     child: _PostScreen(
    //                       index: index,
    //                       bloc: _bloc,
    //                       user: user,
    //                     )));
    //               },
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Expanded(
    //                         child: PostUserInfo(context, post.user ?? user,
    //                             postCreatedDated: post.createdAt!),
    //                       ),
    //                       PopUpPostMenu(
    //                         post: post,
    //                       ),
    //                     ],
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.symmetric(horizontal: 12),
    //                     child: ReadMoreText(
    //                       post.description!,
    //                       trimLines: 2,
    //                       textAlign: TextAlign.start,
    //                       style: TextStyle(
    //                           fontSize: 14, color: Colors.grey, height: 1.4),
    //                       colorClickableText: Colors.blue,
    //                       trimCollapsedText: 'عرض المزيد',
    //                       trimExpandedText: 'عرض القليل',
    //                     ),
    //                   ),
    //                   SizedBox(height: 10),
    //                   PostImagesWidget(post: post),
    //                 ],
    //               ),
    //             ),
    //             Column(
    //               children: [
    //                 Container(
    //                   padding: EdgeInsets.symmetric(horizontal: 15),
    //                   margin: EdgeInsets.symmetric(vertical: 13),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Text(
    //                         (post.likes != null && post.likes != 0)
    //                             ? "${post.likes!} اعجاب"
    //                             : "لا إعجابات",
    //                         style: TextStyle(
    //                             color: Color(0xFF898E92), fontSize: 14),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Divider(),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 21),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       TextButton.icon(
    //                         onPressed: () async {
    //                           if (await sl<PrefsHelper>().getIsLogin()) {
    //                             _bloc.add(LikePost((b) => b..id = post.id));
    //                           } else {
    //                             showLoginFirstDialog(context);
    //                           }
    //                         },
    //                         label: Text(
    //                           'اعجبني',
    //                           style: TextStyle(
    //                             color: !post.isLikedBy!
    //                                 ? Color(0xFF898E92)
    //                                 : primaryColor,
    //                           ),
    //                         ),
    //                         icon: !post.isLikedBy!
    //                             ? SvgPicture.asset(
    //                                 "assets/images/like.svg",
    //                               )
    //                             : SvgPicture.asset(
    //                                 "assets/images/filledLike.svg",
    //                               ),
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             post.commentCount?.toString() ?? '',
    //                             style: TextStyle(color: Color(0xFF898E92)),
    //                           ),
    //                           TextButton.icon(
    //                             onPressed: () {
    //                               Navigator.of(context).push(
    //                                 PageTransition(
    //                                     duration: Duration(milliseconds: 400),
    //                                     type: PageTransitionType.bottomToTop,
    //                                     child: PostComments(
    //                                         postData: post,
    //                                         onCommentSuccess: () {
    //                                           _bloc.add(GetVendorPosts(
    //                                               (b) => b..id = user.id!));
    //                                         })),
    //                               );
    //                             },
    //                             label: Text(
    //                               'تعليق',
    //                               style: TextStyle(color: Color(0xFF898E92)),
    //                             ),
    //                             icon: SvgPicture.asset(
    //                               "assets/images/comment.svg",
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       TextButton.icon(
    //                         onPressed: () {
    //                           Share.share(url + 'posts/${post.id}');
    //                         },
    //                         label: Text(
    //                           'مشاركة',
    //                           style: TextStyle(color: Color(0xFF898E92)),
    //                         ),
    //                         icon: SvgPicture.asset(
    //                           "assets/images/share.svg",
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ],
    //         ),
    //       ],
    //     ));
  }
}

class _PostScreen extends StatelessWidget {
  final int index;
  final UserModel user;

  _PostScreen({
    Key? key,
    required this.index,
    required this.bloc,
    required this.user,
  }) : super(key: key);
  final bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VendorPostBloc>.value(
      value: bloc,
      child: BlocBuilder<VendorPostBloc, VendorPostsState>(
        builder: (context, state) {
          final post = state.posts[index];
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            // appBar: AppBar(
            //   toolbarHeight: 80,
            //   backgroundColor: primaryColor,
            //   title: Text(userName(post.user),
            //       style: TextStyle(color: Colors.white)),
            //   centerTitle: true,
            //   titleSpacing: 4,
            //   elevation: 0,
            // ),
            body: SafeArea(
                child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  children: [
                    10.height,
                    AuthHeaderWidget(title:userName(post.user),),
                    20.height,
                    _PostItem(index: index, user: user),
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
                          width: MediaQuery.sizeOf(context).width,
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
