library vendor_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/post_model/post_model.dart';


part 'vendor_posts_state.g.dart';

abstract class VendorPostsState implements Built<VendorPostsState, VendorPostsStateBuilder> {
  // fields go here
  String? get error;

  bool get isLoading;

  bool get success;

  BuiltList<PostModel> get posts;

  Paginator get postsPaginator;

  bool get initialized;
  VendorPostsState._();

  factory VendorPostsState([updates(VendorPostsStateBuilder b)]) = _$VendorPostsState;

  factory VendorPostsState.initail() {
    return VendorPostsState((b) => b
      ..error = ""
      ..isLoading = false
      ..initialized = false
      ..success = false);
  }
}
