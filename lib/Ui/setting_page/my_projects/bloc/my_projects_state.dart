library my_projects_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/project_model/project_model.dart';

part 'my_projects_state.g.dart';

abstract class MyProjectsState
    implements Built<MyProjectsState, MyProjectsStateBuilder> {
  bool get isLoading;
  bool get addSuccess;
  bool get editSuccess;
  bool get removeSuccess;
  String? get error;

  BuiltList<ProjectModel> get myProjects;

  Paginator get paginator;

  bool get initialized;

  MyProjectsState._();

  factory MyProjectsState([updates(MyProjectsStateBuilder b)]) =
      _$MyProjectsState;

  factory MyProjectsState.init() {
    return MyProjectsState((b) => b
      ..isLoading = false
      ..initialized = false
      ..addSuccess = false
      ..editSuccess = false
      ..removeSuccess = false
      ..error = '');
  }
}
