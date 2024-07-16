library my_products_event;

import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:taknikat/model/product_model/product_model.dart';

part 'my_products_event.g.dart';

abstract class MyProductsEvent {}

abstract class InitMyProducts extends MyProductsEvent
    implements Built<InitMyProducts, InitMyProductsBuilder> {
  InitMyProducts._();
  factory InitMyProducts([updates(InitMyProductsBuilder b)]) = _$InitMyProducts;
}

abstract class AddProduct extends MyProductsEvent
    implements Built<AddProduct, AddProductBuilder> {
  String get title;
  String get description;
  num get price;
  int get categoryId;
  int get status;

  File get image;

  List<File> get images;
  AddProduct._();

  factory AddProduct([updates(AddProductBuilder b)]) = _$AddProduct;
}

abstract class RemoveProduct extends MyProductsEvent
    implements Built<RemoveProduct, RemoveProductBuilder> {
  ProductModel get product;

  RemoveProduct._();

  factory RemoveProduct([updates(RemoveProductBuilder b)]) = _$RemoveProduct;
}

abstract class EditProduct extends MyProductsEvent
    implements Built<EditProduct, EditProductBuilder> {
  int get id;
  String get title;
  String get description;
  String get price;
  int get categoryId;
  int get status;

  File get image;

  List<File> get images;

  EditProduct._();

  factory EditProduct([updates(EditProductBuilder b)]) = _$EditProduct;
}

abstract class ClearState extends MyProductsEvent
    implements Built<ClearState, ClearStateBuilder> {
  ClearState._();

  factory ClearState([updates(ClearStateBuilder b)]) = _$ClearState;
}

abstract class GetMyProducts extends MyProductsEvent
    implements Built<GetMyProducts, GetMyProductsBuilder> {
  GetMyProducts._();

  factory GetMyProducts([updates(GetMyProductsBuilder b)]) = _$GetMyProducts;
}

abstract class GetNextMyProducts extends MyProductsEvent
    implements Built<GetNextMyProducts, GetNextMyProductsBuilder> {
  GetNextMyProducts._();

  factory GetNextMyProducts([updates(GetNextMyProductsBuilder b)]) =
      _$GetNextMyProducts;
}
