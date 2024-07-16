library project_content_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/product_model/comment_model.dart';

part 'project_content_state.g.dart';

abstract class ProjectContentState
    implements Built<ProjectContentState, ProjectContentStateBuilder> {
  String? get error;
  bool get success;

  bool get isLoading;

  BuiltList<CommentModel> get comments;

  Paginator get paginator;

  ProjectContentState._();

  factory ProjectContentState([updates(ProjectContentStateBuilder b)]) =
      _$ProjectContentState;

  factory ProjectContentState.initail() {
    return ProjectContentState((b) => b
      ..error = ""
      // ..favorite.replace([])
      ..success = false
      ..isLoading = false);
  }
}
