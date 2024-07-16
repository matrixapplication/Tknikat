library category_model;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';

part 'category_model.g.dart';

abstract class CategoryModel
    implements Built<CategoryModel, CategoryModelBuilder> {
  int? get id;
  String? get name;

  @BuiltValueField(wireName: "types")
  String? get type;
  String? get image;

  CategoryModel._();

  factory CategoryModel([updates(CategoryModelBuilder b)]) = _$CategoryModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CategoryModel.serializer, this));
  }

  static CategoryModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        CategoryModel.serializer, json.decode(jsonString))!;
  }

  static Serializer<CategoryModel> get serializer => _$categoryModelSerializer;
}
