import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_state.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_screen/post_item.dart';
import 'package:taknikat/core/extensions/extensions.dart';
import 'package:taknikat/core/style/custom_loader.dart';

import '../../../core/app_localizations.dart';
import '../../../core/assets_image/app_images.dart';
import '../../../injectoin.dart';
import 'bloc/posts_bloc/posts_bloc.dart';
import 'bloc/posts_bloc/posts_event.dart';

class MyPostsList extends StatefulWidget {
  @override
  _MyPostsListState createState() => _MyPostsListState();
}

class _MyPostsListState extends State<MyPostsList> {
  final _bloc = sl<PostsBloc>();

  @override
  void initState() {
    _bloc.add(GetNextMyPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, PostsState state) {
          return Stack(
            children: [
              if (state.initialized)
                Column(children: [
                  ...List.generate(
                      state.myPosts.length,
                      (index) => PostItem(
                            index: index,
                            fromMyPostsList: true,
                          )),
                  if (!state.isLoading && state.myPosts.isEmpty)
                    Container(
                        width: sizeAware.width,
                        // height: sizeAware.height * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            40.height,
                            Center(
                              child: SvgPicture.asset(
                                AppImages.noFoundData,

                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate("not_found_posts"),
                                style: TextStyle(),
                              ),
                            )
                          ],
                        )),
                  if (state.isLoading) Center(child: loader(context: context))

                ]),
              if (state.isLoading) Center(child: loader(context: context)),
            ],
          );
        });
  }
}
