library all_categories_event;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

part 'all_categories_event.g.dart';

abstract class AllCategoriesEvent {}

abstract class InitCategories extends AllCategoriesEvent
    implements Built<InitCategories, InitCategoriesBuilder> {
  InitCategories._();
  factory InitCategories([updates(InitCategoriesBuilder b)]) = _$InitCategories;
}

abstract class ClearError extends AllCategoriesEvent
    implements Built<ClearError, ClearErrorBuilder> {
  ClearError._();
  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetCategories extends AllCategoriesEvent
    implements Built<GetCategories, GetCategoriesBuilder> {
  GetCategories._();

  factory GetCategories([updates(GetCategoriesBuilder b)]) = _$GetCategories;
}
