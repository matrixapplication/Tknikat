library project_content_event;

import 'package:built_value/built_value.dart';

part 'project_content_event.g.dart';

abstract class ProjectContentEvent {}

abstract class ClearError extends ProjectContentEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetComments extends ProjectContentEvent
    implements Built<GetComments, GetCommentsBuilder> {
  int get model_id;
  GetComments._();
  factory GetComments([updates(GetCommentsBuilder b)]) = _$GetComments;
}

abstract class GetNextComments extends ProjectContentEvent
    implements Built<GetNextComments, GetNextCommentsBuilder> {
  int get model_id;

  GetNextComments._();
  factory GetNextComments([updates(GetNextCommentsBuilder b)]) =
      _$GetNextComments;
}

abstract class AddComment extends ProjectContentEvent
    implements Built<AddComment, AddCommentBuilder> {
  String get comment;

  ///id of model that [appUser] (me) is commenting on (product. event....)
  int get id;

  ///id of root(main) comment
  int? get parentCommentId;

  /// id of user that [appUser] (me) is replying to his reply
  int? get repliedUserId;
  AddComment._();
  factory AddComment([updates(AddCommentBuilder b)]) = _$AddComment;
}
