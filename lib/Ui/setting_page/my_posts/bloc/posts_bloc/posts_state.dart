library my_posts_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/post_model/post_model.dart';

part 'posts_state.g.dart';

abstract class PostsState implements Built<PostsState, PostsStateBuilder> {
  bool get isLoading;
  bool get addSuccess;
  bool get editSuccess;
  bool get removeSuccess;
  String? get error;

  BuiltList<PostModel> get myPosts;
  BuiltList<PostModel> get posts;
  

  Paginator get myPostsPaginator;
  Paginator get postsPaginator;

  bool get initialized;

  PostsState._();

  factory PostsState([updates(PostsStateBuilder b)]) = _$PostsState;

  factory PostsState.init() {
    return PostsState((b) => b
      ..isLoading = false
      ..initialized = false
      ..addSuccess = false
      ..editSuccess = false
      ..removeSuccess = false
      ..error = '');
  }
}
