library vendor_event;

import 'package:built_value/built_value.dart';

part 'vendor_posts_event.g.dart';

abstract class VendorPostsEvent {}

abstract class ClearError extends VendorPostsEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetVendorPosts extends VendorPostsEvent
    implements Built<GetVendorPosts, GetVendorPostsBuilder> {
  int get id;
  GetVendorPosts._();

  factory GetVendorPosts([updates(GetVendorPostsBuilder b)]) = _$GetVendorPosts;
}

abstract class GetNextVendorPosts extends VendorPostsEvent
    implements Built<GetNextVendorPosts, GetNextVendorPostsBuilder> {
  int? get id;

  GetNextVendorPosts._();

  factory GetNextVendorPosts([updates(GetNextVendorPostsBuilder b)]) =
      _$GetNextVendorPosts;
}

abstract class LikePost extends VendorPostsEvent
    implements Built<LikePost, LikePostBuilder> {
  int? get id;

  LikePost._();

  factory LikePost([updates(LikePostBuilder b)]) = _$LikePost;
}
