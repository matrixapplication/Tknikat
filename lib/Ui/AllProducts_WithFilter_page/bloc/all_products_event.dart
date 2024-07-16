library all_products_event;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/core/filters/filter_class.dart';

part 'all_products_event.g.dart';

abstract class AllProductsEvent {}

abstract class ClearError extends AllProductsEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetAllProducts extends AllProductsEvent
    implements Built<GetAllProducts, GetAllProductsBuilder> {
  CustomFilter get customFilter;

  GetAllProducts._();

  factory GetAllProducts([updates(GetAllProductsBuilder b)]) = _$GetAllProducts;
}

abstract class GetNext extends AllProductsEvent
    implements Built<GetNext, GetNextBuilder> {
  // fields go here
  CustomFilter get customFilter;

  GetNext._();

  factory GetNext([updates(GetNextBuilder b)]) = _$GetNext;
}

// abstract class GetFilter extends AllProductsEvent
//     implements Built<GetFilter, GetFilterBuilder> {
//   String get type;

//   GetFilter._();

//   factory GetFilter([updates(GetFilterBuilder b)]) = _$GetFilter;
// }
