import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_screen/post_comment.dart';
import 'package:taknikat/core/base_widget/dialogcustom.dart';
import 'package:taknikat/core/constent.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/post_model/post_model.dart';

import '../../../../core/app_localizations.dart';
import '../bloc/posts_bloc/posts_bloc.dart';
import '../bloc/posts_bloc/posts_event.dart';
import '../bloc/posts_bloc/posts_state.dart';

class BottomPostWidget extends StatelessWidget {
  BottomPostWidget({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  final _bloc = sl<PostsBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (BuildContext context, PostsState state) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    (post.likes != null && post.likes != 0)
                        ? "${post.likes!}${AppLocalizations.of(context)
            .translate("like")}"
                        : "${AppLocalizations.of(context)
            .translate("no_likes")}",
                    style: TextStyle(color: Color(0xFF898E92), fontSize: 14),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      if (appAuthState) {
                        _bloc.add(GetLikePost((b) => b..id = post.id));
                      } else {
                        showLogin(context);
                      }
                    },
                    label: Text(
                        AppLocalizations.of(context)
                            .translate("like2"),
                      style: TextStyle(
                        color:
                            !post.isLikedBy! ? Color(0xFF898E92) : primaryColor,
                      ),
                    ),
                    icon: !post.isLikedBy!
                        ? SvgPicture.asset(
                            "assets/images/like.svg",
                          )
                        : SvgPicture.asset(
                            "assets/images/filledLike.svg",
                          ),
                  ),
                  Row(
                    children: [
                      Text(
                        post.commentCount?.toString() ?? '',
                        style: TextStyle(color: Color(0xFF898E92)),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageTransition(
                                duration: Duration(milliseconds: 400),
                                type: PageTransitionType.bottomToTop,
                                child: PostComments(
                                  postData: post,
                                )),
                          );
                        },
                        label: Text(
                          AppLocalizations.of(context)
                              .translate("Comment"),
                          style: TextStyle(color: Color(0xFF898E92)),
                        ),
                        icon: SvgPicture.asset(
                          "assets/images/comment.svg",
                        ),
                      )
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Share.share(url + 'post/${post.id}');
                    },
                    label: Text(
                      AppLocalizations.of(context)
                          .translate("share"),
                      style: TextStyle(color: Color(0xFF898E92)),
                    ),
                    icon: SvgPicture.asset(
                      "assets/images/share.svg",
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
