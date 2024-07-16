library all_projects_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/project_model/project_model.dart';

part 'all_projects_state.g.dart';

abstract class AllProjectsState
    implements Built<AllProjectsState, AllProjectsStateBuilder> {
  String? get error;
  bool get isLoading;

  BuiltList<ProjectModel> get projects;

  Paginator get paginator;
  AllProjectsState._();

  factory AllProjectsState([updates(AllProjectsStateBuilder b)]) =
      _$AllProjectsState;

  factory AllProjectsState.initail() {
    return AllProjectsState((b) => b
      ..error = ""
      ..isLoading = false
      ..paginator = null
      ..projects.replace([]));
  }
}
