library my_posts_event;

import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:taknikat/Ui/setting_page/my_posts/update_post/update_post_provider.dart';
import 'package:taknikat/model/post_model/add_post.dart';
import 'package:taknikat/model/post_model/post_model.dart';

part 'posts_event.g.dart';

abstract class PostsEvent {}

abstract class InitMyPosts extends PostsEvent
    implements Built<InitMyPosts, InitMyPostsBuilder> {
  InitMyPosts._();

  factory InitMyPosts([updates(InitMyPostsBuilder b)]) = _$InitMyPosts;
}


abstract class InitPosts extends PostsEvent
    implements Built<InitPosts, InitPostsBuilder> {
  int? get page;

  InitPosts._();

  factory InitPosts([updates(InitPostsBuilder b)]) = _$InitPosts;
}

class IncrementCommentCount extends PostsEvent {
  final int postId;

  IncrementCommentCount(this.postId);
}

abstract class AddPost extends PostsEvent
    implements Built<AddPost, AddPostBuilder> {
  String get description;

  List<File> get images;

  List<AddPostModel> get subPosts;

  String get id;

  AddPost._();

  factory AddPost([updates(AddPostBuilder b)]) = _$AddPost;
}

abstract class RemovePost extends PostsEvent
    implements Built<RemovePost, RemovePostBuilder> {
  PostModel get post;

  RemovePost._();

  factory RemovePost([updates(RemovePostBuilder b)]) = _$RemovePost;
}

abstract class EditPost extends PostsEvent
    implements Built<EditPost, EditPostBuilder> {
  int? get id;

  String get description;

  List<File> get images;

  List<String> get imagesToRemove;

  List<SubPostParam> get subPosts;

  EditPost._();

  factory EditPost([updates(EditPostBuilder b)]) = _$EditPost;
}

abstract class ClearState extends PostsEvent
    implements Built<ClearState, ClearStateBuilder> {
  ClearState._();

  factory ClearState([updates(ClearStateBuilder b)]) = _$ClearState;
}

abstract class GetMyPosts extends PostsEvent
    implements Built<GetMyPosts, GetMyPostsBuilder> {
  GetMyPosts._();

  factory GetMyPosts([updates(GetMyPostsBuilder b)]) = _$GetMyPosts;
}

abstract class GetNextMyPosts extends PostsEvent
    implements Built<GetNextMyPosts, GetNextMyPostsBuilder> {
  GetNextMyPosts._();

  factory GetNextMyPosts([updates(GetNextMyPostsBuilder b)]) = _$GetNextMyPosts;
}

abstract class GetNextPosts extends PostsEvent
    implements Built<GetNextPosts, GetNextPostsBuilder> {
  bool? get isCurrentPage;
  GetNextPosts._();

  factory GetNextPosts([updates(GetNextPostsBuilder b)]) = _$GetNextPosts;
}

abstract class GetLikePost extends PostsEvent
    implements Built<GetLikePost, GetLikePostBuilder> {
  int? get id;

  GetLikePost._();

  factory GetLikePost([updates(GetLikePostBuilder b)]) = _$GetLikePost;
}
