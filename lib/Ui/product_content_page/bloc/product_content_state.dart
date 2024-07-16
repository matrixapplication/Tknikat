library product_content_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/product_model/comment_model.dart';

part 'product_content_state.g.dart';

abstract class ProductContentState
    implements Built<ProductContentState, ProductContentStateBuilder> {
  // fields go here

  String? get error;
  bool get success;

  BuiltList<CommentModel> get comments;

  Paginator get paginator;

  //

  // BuiltList<FavoriteList> get favorite;
  //
  // BuiltList<CartModel> get cart;

  bool get isLoading;

  ProductContentState._();

  factory ProductContentState([updates(ProductContentStateBuilder b)]) =
      _$ProductContentState;

  factory ProductContentState.initail() {
    return ProductContentState((b) => b
      ..error = ""
      // ..favorite.replace([])
      ..success = false
      ..isLoading = false);
  }
}
