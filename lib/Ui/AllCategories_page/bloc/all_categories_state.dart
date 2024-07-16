library all_categories_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/category_model/category_model.dart';
import 'package:taknikat/model/event_model/event_model.dart';

part 'all_categories_state.g.dart';

abstract class AllCategoriesState
    implements Built<AllCategoriesState, AllCategoriesStateBuilder> {
  // fields go here

  String? get error;

  bool get isLoading;

  bool get success;

  bool get initialized;

  BuiltList<CategoryModel> get servicesCategories;

  BuiltList<CategoryModel> get productsCategories;

  BuiltList<CategoryModel> get projectsCategories;

  BuiltList<EventModel> get projectsEvents;

  AllCategoriesState._();

  factory AllCategoriesState([updates(AllCategoriesStateBuilder b)]) =
      _$AllCategoriesState;

  factory AllCategoriesState.initail() {
    return AllCategoriesState((b) => b
      ..error = ""
      ..isLoading = true
      ..success = false
      ..productsCategories.replace([])
      ..projectsCategories.replace([])
      ..servicesCategories.replace([])
      ..projectsEvents.replace([])
      ..initialized = false);
  }
}
