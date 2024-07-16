library attributes;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/category_model/category_model.dart';
import 'package:taknikat/model/serializer/serializer.dart';

part 'attributes.g.dart';

abstract class Attributes implements Built<Attributes, AttributesBuilder> {
  String? get min_price;
  String? get max_price;
  BuiltList<String>? get sizes;
  BuiltList<String>? get colors;

  @BuiltValueField(wireName: "categories")
  BuiltList<CategoryModel>? get categoryModel;

  Attributes._();

  factory Attributes([updates(AttributesBuilder b)]) = _$Attributes;

  String toJson() {
    return json.encode(serializers.serializeWith(Attributes.serializer, this));
  }

  static Attributes fromJson(String jsonString) {
    return serializers.deserializeWith(
        Attributes.serializer, json.decode(jsonString))!;
  }

  static Serializer<Attributes> get serializer => _$attributesSerializer;
}
