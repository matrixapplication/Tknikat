part of 'share_bloc.dart';

@immutable
abstract class ShareEvent {}

class CommentsFetched extends ShareEvent {
  final int page;

  CommentsFetched({this.page = 1});
}

class CommentAdded extends ShareEvent {
  final String comment;
  final int id;
  final int? parentCommentId;
  final int? repliedUserId;

  CommentAdded({
    required this.comment,
    required this.id,
    this.parentCommentId,
    this.repliedUserId,
  });
}

class ApproveShare extends ShareEvent {
  final int id;

  ApproveShare({
    required this.id,
  });
}

class GetRejectReasons extends ShareEvent {}

class RejectShare extends ShareEvent {
  final String rejectId;
  final String modelId;
  final String text;

  RejectShare({
    required this.rejectId,
    required this.modelId,
    required this.text,
  });
}
