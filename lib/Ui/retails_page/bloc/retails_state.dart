library retails_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/product_model/product_model.dart';

part 'retails_state.g.dart';

abstract class RetailsState
    implements Built<RetailsState, RetailsStateBuilder> {
  String? get error;
  bool get isLoading;

  BuiltList<ProductModel> get retails;

  Paginator get paginator;

  //
  // BuiltList<CartModel> get cart;

  RetailsState._();

  factory RetailsState([updates(RetailsStateBuilder b)]) = _$RetailsState;

  factory RetailsState.initail() {
    return RetailsState((b) => b
      ..error = ""
      ..isLoading = false
      ..paginator = null
      ..retails.replace([]));
  }
}
