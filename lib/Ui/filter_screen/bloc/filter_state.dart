library filter_state;

import 'package:built_value/built_value.dart';
import 'package:taknikat/model/category_model/category_model.dart';
import 'package:taknikat/model/country/country_model.dart';

part 'filter_state.g.dart';

abstract class FilterState implements Built<FilterState, FilterStateBuilder> {
  String? get error;
  bool get isLoading;

  List<CategoryModel> get categories;
  List<Country> get countries;

  FilterState._();

  factory FilterState([updates(FilterStateBuilder b)]) = _$FilterState;

  factory FilterState.initail() {
    return FilterState((b) => b
      ..error = null
      ..categories = []
      ..countries = []
      ..isLoading = true);
    ;
  }
}
