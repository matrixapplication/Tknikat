import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/setting_page/my_posts/bloc/posts_bloc/posts_state.dart';
import 'package:taknikat/Ui/setting_page/my_posts/post_screen/post_item.dart';
import 'package:taknikat/core/style/custom_loader.dart';

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
                  if (state.isLoading) Center(child: loader(context: context))
                ]),
              if (state.isLoading) Center(child: loader(context: context)),
            ],
          );
        });
  }
}
