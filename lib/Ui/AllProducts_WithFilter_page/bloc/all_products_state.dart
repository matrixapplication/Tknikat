library all_products_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/product_model/product_model.dart';

part 'all_products_state.g.dart';

abstract class AllProductsState
    implements Built<AllProductsState, AllProductsStateBuilder> {
  String? get error;
  bool get isLoading;

  BuiltList<ProductModel> get products;

  Paginator get paginator;
  AllProductsState._();

  factory AllProductsState([updates(AllProductsStateBuilder b)]) =
      _$AllProductsState;

  factory AllProductsState.initail() {
    return AllProductsState((b) => b
      ..error = null
      ..isLoading = false
      ..paginator = null
      ..products.replace([]));
  }
}
