library product_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'product_model.g.dart';

abstract class ProductModel
    implements Built<ProductModel, ProductModelBuilder> {
  int? get id;

  String get slug;

  double? get price;

  @BuiltValueField(wireName: "featured_image")
  String? get featuredImage;

  BuiltList<String>? get images;
  @BuiltValueField(wireName: "can_be_ordered")
  bool? get canBeOrdered;

  @BuiltValueField(wireName: "has_pending_order")
  bool? get hasPendingOrder;
  int? get rate;

  @BuiltValueField(wireName: "is_new")
  bool? get isNew;

  @BuiltValueField(wireName: "category_id")
  int? get categoryId;

  String? get name;

  @BuiltValueField(wireName: "raw_description")
  String? get description;

  String? get city_name;

  String? get country_name;

  UserModel? get user;

  @BuiltValueField(wireName: "created_at")
  String? get createdAt;

  ProductModel._();

  factory ProductModel([updates(ProductModelBuilder b)]) = _$ProductModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ProductModel.serializer, this));
  }

  static ProductModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        ProductModel.serializer, json.decode(jsonString))!;
  }

  @BuiltValueSerializer(custom: true)
  static Serializer<ProductModel> get serializer =>
      _$CustomProductModelSerializer();
}

class _$CustomProductModelSerializer
    implements StructuredSerializer<ProductModel> {
  @override
  final Iterable<Type> types = const [ProductModel, _$ProductModel];
  @override
  final String wireName = 'ProductModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'slug',
      serializers.serialize(object.slug, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.featuredImage;
    if (value != null) {
      result
        ..add('featured_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hasPendingOrder;
    if (value != null) {
      result
        ..add('has_pending_order')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(bool)));
    }
    value = object.canBeOrdered;
    if (value != null) {
      result
        ..add('can_be_ordered')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(bool)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.rate;
    if (value != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isNew;
    if (value != null) {
      result
        ..add('is_new')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.categoryId;
    if (value != null) {
      result
        ..add('category_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('raw_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city_name;
    if (value != null) {
      result
        ..add('city_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country_name;
    if (value != null) {
      result
        ..add('country_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(UserModel)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ProductModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'slug':
          result.slug = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'featured_image':
          result.featuredImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'has_pending_order':
          result.hasPendingOrder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'can_be_ordered':
          result.canBeOrdered = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_new':
          result.isNew = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'category_id':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'raw_description':
          result.description = serializers.deserialize(
              (value as String).replaceAll('<br>', '\n'),
              specifiedType: const FullType(String)) as String?;
          ;
          break;
        case 'city_name':
          result.city_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country_name':
          result.country_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserModel))! as UserModel);
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}
