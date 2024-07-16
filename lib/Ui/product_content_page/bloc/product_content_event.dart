library product_content_event;

import 'package:built_value/built_value.dart';

part 'product_content_event.g.dart';

abstract class ProductContentEvent {}

abstract class ClearError extends ProductContentEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetComments extends ProductContentEvent
    implements Built<GetComments, GetCommentsBuilder> {
  int get model_id;
  GetComments._();
  factory GetComments([updates(GetCommentsBuilder b)]) = _$GetComments;
}
abstract class UpdateComment extends ProductContentEvent
    implements Built<UpdateComment, UpdateCommentBuilder> {
  int get postId;
  int get id;
  String get content;
  UpdateComment._();
  factory UpdateComment([updates(UpdateCommentBuilder b)]) = _$UpdateComment;
}

abstract class GetNextComments extends ProductContentEvent
    implements Built<GetNextComments, GetNextCommentsBuilder> {
  int get model_id;

  GetNextComments._();
  factory GetNextComments([updates(GetNextCommentsBuilder b)]) =
      _$GetNextComments;
}

abstract class AddComment extends ProductContentEvent
    implements Built<AddComment, AddCommentBuilder> {
  String get comment;
  int get id;
  int? get parentCommentId;
  int? get repliedUserId;
  AddComment._();
  factory AddComment([updates(AddCommentBuilder b)]) = _$AddComment;
}
