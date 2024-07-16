library home_event;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/category_model/category_model.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}

abstract class InitHome extends HomeEvent
    implements Built<InitHome, InitHomeBuilder> {
  InitHome._();
  factory InitHome([updates(InitHomeBuilder b)]) = _$InitHome;
}

abstract class ClearError extends HomeEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetLanguage extends HomeEvent
    implements Built<GetLanguage, GetLanguageBuilder> {
  // fields go here

  GetLanguage._();

  factory GetLanguage([updates(GetLanguageBuilder b)]) = _$GetLanguage;
}

abstract class GetAllProducts extends HomeEvent
    implements Built<GetAllProducts, GetAllProductsBuilder> {
  int get is_new;

  GetAllProducts._();

  factory GetAllProducts([updates(GetAllProductsBuilder b)]) = _$GetAllProducts;
}

abstract class ChangeStatus extends HomeEvent
    implements Built<ChangeStatus, ChangeStatusBuilder> {
  // fields go here

  ChangeStatus._();

  factory ChangeStatus([updates(ChangeStatusBuilder b)]) = _$ChangeStatus;
}

abstract class GetFilter extends HomeEvent
    implements Built<GetFilter, GetFilterBuilder> {
  String get type;

  GetFilter._();

  factory GetFilter([updates(GetFilterBuilder b)]) = _$GetFilter;
}
