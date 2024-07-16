library retails_event;

import 'package:built_value/built_value.dart';

part 'retails_event.g.dart';

abstract class RetailsEvent {}

abstract class ClearError extends RetailsEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetCategoryRetails extends RetailsEvent
    implements Built<GetCategoryRetails, GetCategoryRetailsBuilder> {
  // fields go here

  int get categoryId;

  GetCategoryRetails._();

  factory GetCategoryRetails([updates(GetCategoryRetailsBuilder b)]) =
      _$GetCategoryRetails;
}

abstract class GetNext extends RetailsEvent
    implements Built<GetNext, GetNextBuilder> {
  // fields go here

  int get categoryId;

  GetNext._();

  factory GetNext([updates(GetNextBuilder b)]) = _$GetNext;
}

abstract class GetAllCategories extends RetailsEvent
    implements Built<GetAllCategories, GetAllCategoriesBuilder> {
  String get type;

  GetAllCategories._();

  factory GetAllCategories([updates(GetAllCategoriesBuilder b)]) =
      _$GetAllCategories;
}

abstract class ChangeState extends RetailsEvent
    implements Built<ChangeState, ChangeStateBuilder> {
  // fields go here

  ChangeState._();

  factory ChangeState([updates(ChangeStateBuilder b)]) = _$ChangeState;
}

abstract class GetCart extends RetailsEvent
    implements Built<GetCart, GetCartBuilder> {
  // fields go here

  GetCart._();

  factory GetCart([updates(GetCartBuilder b)]) = _$GetCart;
}

abstract class SearchRetails extends RetailsEvent
    implements Built<SearchRetails, SearchRetailsBuilder> {
  // fields go here

  int get categoryId;

  String get search;

  SearchRetails._();

  factory SearchRetails([updates(SearchRetailsBuilder b)]) = _$SearchRetails;
}
