library all_services_event;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/core/filters/filter_class.dart';

part 'all_services_event.g.dart';

abstract class AllServicesEvent {}

abstract class ClearError extends AllServicesEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetAllServices extends AllServicesEvent
    implements Built<GetAllServices, GetAllServicesBuilder> {
  CustomFilter get customFilter;

  GetAllServices._();

  factory GetAllServices([updates(GetAllServicesBuilder b)]) = _$GetAllServices;
}

abstract class GetNext extends AllServicesEvent
    implements Built<GetNext, GetNextBuilder> {
  // fields go here
  CustomFilter get customFilter;

  GetNext._();

  factory GetNext([updates(GetNextBuilder b)]) = _$GetNext;
}

// abstract class GetFilter extends AllServicesEvent
//     implements Built<GetFilter, GetFilterBuilder> {
//   String get type;

//   GetFilter._();

//   factory GetFilter([updates(GetFilterBuilder b)]) = _$GetFilter;
// }
