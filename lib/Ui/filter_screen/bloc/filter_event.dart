library filter_event;

import 'package:built_value/built_value.dart';

part 'filter_event.g.dart';

abstract class FilterEvent {}

abstract class ClearError extends FilterEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetFilterByCategory extends FilterEvent
    implements Built<GetFilterByCategory, GetFilterByCategoryBuilder> {
  // fields go here

  int? get categoryId;

  GetFilterByCategory._();

  factory GetFilterByCategory([updates(GetFilterByCategoryBuilder b)]) =
      _$GetFilterByCategory;
}

abstract class ChangeState extends FilterEvent
    implements Built<ChangeState, ChangeStateBuilder> {
  // fields go here

  ChangeState._();

  factory ChangeState([updates(ChangeStateBuilder b)]) = _$ChangeState;
}

abstract class GetCart extends FilterEvent
    implements Built<GetCart, GetCartBuilder> {
  // fields go here

  GetCart._();

  factory GetCart([updates(GetCartBuilder b)]) = _$GetCart;
}

abstract class SearchRetails extends FilterEvent
    implements Built<SearchRetails, SearchRetailsBuilder> {
  // fields go here

  int get categoryId;

  String get search;

  SearchRetails._();

  factory SearchRetails([updates(SearchRetailsBuilder b)]) = _$SearchRetails;
}
