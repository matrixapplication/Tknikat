library my_products_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/product_model/product_model.dart';

part 'my_products_state.g.dart';

abstract class MyProductsState
    implements Built<MyProductsState, MyProductsStateBuilder> {
  bool get isLoading;
  bool get addSuccess;
  bool get editSuccess;
  bool get removeSuccess;
  String? get error;

  BuiltList<ProductModel> get myProducts;

  Paginator get paginator;

  bool get initialized;

  MyProductsState._();

  factory MyProductsState([updates(MyProductsStateBuilder b)]) =
      _$MyProductsState;

  factory MyProductsState.init() {
    return MyProductsState((b) => b
      ..isLoading = false
      ..initialized = false
      ..addSuccess = false
      ..editSuccess = false
      ..removeSuccess = false
      ..error = '');
  }
}
