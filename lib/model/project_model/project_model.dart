library project_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'project_model.g.dart';

abstract class ProjectModel
    implements Built<ProjectModel, ProjectModelBuilder> {
  int? get id;
  @BuiltValueField(wireName: "user_id")
  int? get userId;
  String? get slug;

  @BuiltValueField(wireName: "featured_image")
  String? get featuredImage;

  @BuiltValueField(wireName: "youtube_link")
  String? get youtubeLink;

  int? get rate;

  @BuiltValueField(wireName: "is_new")
  bool? get isNew;

  String? get name;
  @BuiltValueField(wireName: "raw_description")
  String? get description;

  @BuiltValueField(wireName: "updated_at")
  String? get updatedAt;
  @BuiltValueField(wireName: "created_at")
  String? get createdAt;

  @BuiltValueField(wireName: "project_date")
  String? get projectDate;

  String? get city_name;

  String? get country_name;

  UserModel? get user;

  ProjectModel._();

  factory ProjectModel([updates(ProjectModelBuilder b)]) = _$ProjectModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(ProjectModel.serializer, this));
  }

  static ProjectModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        ProjectModel.serializer, json.decode(jsonString))!;
  }
  @BuiltValueSerializer(custom: true)

  static Serializer<ProjectModel> get serializer => _$CustomProjectModelSerializer();
}


class _$CustomProjectModelSerializer implements StructuredSerializer<ProjectModel> {
  @override
  final Iterable<Type> types = const [ProjectModel, _$ProjectModel];
  @override
  final String wireName = 'ProjectModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProjectModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.slug;
    if (value != null) {
      result
        ..add('slug')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.featuredImage;
    if (value != null) {
      result
        ..add('featured_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.youtubeLink;
    if (value != null) {
      result
        ..add('youtube_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.projectDate;
    if (value != null) {
      result
        ..add('project_date')
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
    return result;
  }

  @override
  ProjectModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProjectModelBuilder();

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
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'slug':
          result.slug = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'featured_image':
          result.featuredImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'youtube_link':
          result.youtubeLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_new':
          result.isNew = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'raw_description':
          result.description = serializers.deserialize(
              (value as String).replaceAll('<br>', '\n'),
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'project_date':
          result.projectDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
      }
    }

    return result.build();
  }
}

