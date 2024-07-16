library services_event;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'services_event.g.dart';

abstract class EventsEvent {}

abstract class ClearError extends EventsEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetCategoryServices extends EventsEvent
    implements Built<GetCategoryServices, GetCategoryServicesBuilder> {
  // fields go here

  int get categoryId;

  GetCategoryServices._();

  factory GetCategoryServices([updates(GetCategoryServicesBuilder b)]) =
      _$GetCategoryServices;
}

abstract class GetNext extends EventsEvent
    implements Built<GetNext, GetNextBuilder> {
  // fields go here

  int get categoryId;

  GetNext._();

  factory GetNext([updates(GetNextBuilder b)]) = _$GetNext;
}

abstract class GetAllCategories extends EventsEvent
    implements Built<GetAllCategories, GetAllCategoriesBuilder> {
  String get type;

  GetAllCategories._();

  factory GetAllCategories([updates(GetAllCategoriesBuilder b)]) =
      _$GetAllCategories;
}

abstract class ChangeState extends EventsEvent
    implements Built<ChangeState, ChangeStateBuilder> {
  // fields go here

  ChangeState._();

  factory ChangeState([updates(ChangeStateBuilder b)]) = _$ChangeState;
}

abstract class GetDayShifts extends EventsEvent
    implements Built<GetDayShifts, GetDayShiftsBuilder> {
  // fields go here

  int get service_id;

  DateTime get date;

  GetDayShifts._();

  factory GetDayShifts([updates(GetDayShiftsBuilder b)]) = _$GetDayShifts;
}

abstract class BookService extends EventsEvent
    implements Built<BookService, BookServiceBuilder> {
  int get service_id;

  int get store_shift_id;

  DateTime get date;

  BookService._();

  factory BookService([updates(BookServiceBuilder b)]) = _$BookService;
}

abstract class SearchServices extends EventsEvent
    implements Built<SearchServices, SearchServicesBuilder> {
  // fields go here

  int get categoryId;

  String get search;

  SearchServices._();

  factory SearchServices([updates(SearchServicesBuilder b)]) = _$SearchServices;
}
