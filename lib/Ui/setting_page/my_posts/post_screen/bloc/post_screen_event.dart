library product_content_event;

import 'package:built_value/built_value.dart';

import '../../../../../core/base_widget/comment.dart';

part 'post_screen_event.g.dart';

abstract class PostScreenEvent {}

abstract class ClearError extends PostScreenEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetComments extends PostScreenEvent
    implements Built<GetComments, GetCommentsBuilder> {
  int get model_id;
  GetComments._();
  factory GetComments([updates(GetCommentsBuilder b)]) = _$GetComments;
}

abstract class GetNextComments extends PostScreenEvent
    implements Built<GetNextComments, GetNextCommentsBuilder> {
  int get model_id;

  GetNextComments._();
  factory GetNextComments([updates(GetNextCommentsBuilder b)]) =
      _$GetNextComments;
}

abstract class AddComment extends PostScreenEvent
    implements Built<AddComment, AddCommentBuilder> {
  String get comment;
  int get id;
  int? get parentCommentId;
  int? get repliedUserId;
  AddComment._();
  factory AddComment([updates(AddCommentBuilder b)]) = _$AddComment;
}

abstract class UpdateComment extends PostScreenEvent
    implements Built<UpdateComment, UpdateCommentBuilder> {
  int get postId;
  int get id;
  String get content;
  UpdateComment._();
  factory UpdateComment([updates(UpdateCommentBuilder b)]) = _$UpdateComment;
}


abstract class AddReplayComment extends PostScreenEvent
    implements Built<AddReplayComment, AddReplayCommentBuilder> {
  OnReply get onReply;
  int get repliedUserId;
  AddReplayComment._();
  factory AddReplayComment([updates(AddReplayCommentBuilder b)]) = _$AddReplayComment;
}
