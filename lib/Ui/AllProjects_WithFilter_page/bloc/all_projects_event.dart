library all_projects_event;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/core/filters/filter_class.dart';

part 'all_projects_event.g.dart';

abstract class AllProjectsEvent {}

abstract class ClearError extends AllProjectsEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetAllProjects extends AllProjectsEvent
    implements Built<GetAllProjects, GetAllProjectsBuilder> {
  CustomFilter get customFilter;

  GetAllProjects._();

  factory GetAllProjects([updates(GetAllProjectsBuilder b)]) = _$GetAllProjects;
}

abstract class GetNext extends AllProjectsEvent
    implements Built<GetNext, GetNextBuilder> {
  // fields go here
  CustomFilter get customFilter;

  GetNext._();

  factory GetNext([updates(GetNextBuilder b)]) = _$GetNext;
}

// abstract class GetFilter extends AllProjectsEvent
//     implements Built<GetFilter, GetFilterBuilder> {
//   String get type;

//   GetFilter._();

//   factory GetFilter([updates(GetFilterBuilder b)]) = _$GetFilter;
// }
