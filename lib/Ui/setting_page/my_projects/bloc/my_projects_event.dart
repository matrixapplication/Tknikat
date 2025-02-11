library my_projects_event;

import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:taknikat/model/project_model/project_model.dart';

part 'my_projects_event.g.dart';

abstract class MyProjectsEvent {}

abstract class InitMyProjects extends MyProjectsEvent
    implements Built<InitMyProjects, InitMyProjectsBuilder> {
  InitMyProjects._();
  factory InitMyProjects([updates(InitMyProjectsBuilder b)]) = _$InitMyProjects;
}

abstract class AddProject extends MyProjectsEvent
    implements Built<AddProject, AddProjectBuilder> {
  String get title;
  String get description;
  String get yotubeUrl;
  File get image;
  AddProject._();

  factory AddProject([updates(AddProjectBuilder b)]) = _$AddProject;
}

abstract class RemoveProject extends MyProjectsEvent
    implements Built<RemoveProject, RemoveProjectBuilder> {
  ProjectModel get project;

  RemoveProject._();

  factory RemoveProject([updates(RemoveProjectBuilder b)]) = _$RemoveProject;
}

abstract class EditProject extends MyProjectsEvent
    implements Built<EditProject, EditProjectBuilder> {
  int get id;
  String get title;
  String get description;
  String get yotubeUrl;

  File? get image;

  EditProject._();

  factory EditProject([updates(EditProjectBuilder b)]) = _$EditProject;
}

abstract class ClearState extends MyProjectsEvent
    implements Built<ClearState, ClearStateBuilder> {
  ClearState._();

  factory ClearState([updates(ClearStateBuilder b)]) = _$ClearState;
}

abstract class GetMyProjects extends MyProjectsEvent
    implements Built<GetMyProjects, GetMyProjectsBuilder> {
  GetMyProjects._();

  factory GetMyProjects([updates(GetMyProjectsBuilder b)]) = _$GetMyProjects;
}

abstract class GetNextMyProjects extends MyProjectsEvent
    implements Built<GetNextMyProjects, GetNextMyProjectsBuilder> {
  GetNextMyProjects._();

  factory GetNextMyProjects([updates(GetNextMyProjectsBuilder b)]) =
      _$GetNextMyProjects;
}
