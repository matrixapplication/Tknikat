library product_content_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/product_model/comment_model.dart';

part 'post_screen_state.g.dart';

abstract class PostScreenState
    implements Built<PostScreenState, PostScreenStateBuilder> {
  // fields go here

  String? get error;
  bool get success;

  BuiltList<CommentModel> get comments;

  Paginator get paginator;

  bool get isLoading;

  PostScreenState._();

  factory PostScreenState([updates(PostScreenStateBuilder b)]) =
      _$PostScreenState;

  factory PostScreenState.initail() {
    return PostScreenState((b) => b
      ..error = ""
      ..success = false
      ..isLoading = false);
  }
}
