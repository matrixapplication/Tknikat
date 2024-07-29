library service_content_event;

import 'package:built_value/built_value.dart';

part 'service_content_event.g.dart';

abstract class ServiceContentEvent {}

abstract class ClearError extends ServiceContentEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetComments extends ServiceContentEvent
    implements Built<GetComments, GetCommentsBuilder> {
  int get model_id;
  GetComments._();
  factory GetComments([updates(GetCommentsBuilder b)]) = _$GetComments;
}

abstract class AddComment extends ServiceContentEvent
    implements Built<AddComment, AddCommentBuilder> {
  String get comment;
  int get id;
  int? get parentCommentId;
  int? get repliedUserId;
  AddComment._();
  factory AddComment([updates(AddCommentBuilder b)]) = _$AddComment;
}
abstract class UpdateComment extends ServiceContentEvent
    implements Built<UpdateComment, UpdateCommentBuilder> {
  int get postId;
  int get id;
  String get content;
  UpdateComment._();
  factory UpdateComment([updates(UpdateCommentBuilder b)]) = _$UpdateComment;
}
abstract class GetNextComments extends ServiceContentEvent
    implements Built<GetNextComments, GetNextCommentsBuilder> {
  int get model_id;

  GetNextComments._();
  factory GetNextComments([updates(GetNextCommentsBuilder b)]) =
      _$GetNextComments;
}
