library post_model;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/serializer/serializer.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'post_model.g.dart';

abstract class PostModel implements Built<PostModel, PostModelBuilder> {
  int? get id;

  @BuiltValueField(wireName: "featured_image")
  String? get featuredImage;

  @BuiltValueField(wireName: "likes_count")
  int? get likes;

  @BuiltValueField(wireName: "comments_count")
  int? get commentCount;

  BuiltList<String>? get images;

  BuiltList<File>? get addedImages;

  String? get slug;

  // @BuiltValueField(wireName: "isLikedBy")
  bool? get isLikedBy;

  @BuiltValueField(wireName: "description")
  String? get description;

  @BuiltValueField(wireName: "created_at")
  String? get createdAt;

  @BuiltValueField(wireName: "sub")
  BuiltList<PostModel>? get subPosts;

  UserModel? get user;

  PostModel._();

  factory PostModel([updates(PostModelBuilder b)]) = _$PostModel;

  String toJson() {
    return json.encode(serializers.serializeWith(PostModel.serializer, this));
  }

  static PostModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        PostModel.serializer, json.decode(jsonString))!;
  }

  @BuiltValueSerializer(custom: true)
  static Serializer<PostModel> get serializer => CustomModelSerializer();
}

extension PostModelExt on PostModel {
  bool get isMyPost {
    if (this.user != null) {
      return (this.user!.id! == appUser?.id);
    }
    return true;
  }
}

class CustomModelSerializer implements StructuredSerializer<PostModel> {
  @override
  final Iterable<Type> types = const [PostModel, _$PostModel];
  @override
  final String wireName = 'PostModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.featuredImage;
    if (value != null) {
      result
        ..add('featured_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.commentCount;
    if (value != null) {
      result
        ..add('comments_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.addedImages;
    if (value != null) {
      result
        ..add('addedImages')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(File)])));
    }
    value = object.slug;
    if (value != null) {
      result
        ..add('slug')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isLikedBy;
    if (value != null) {
      result
        ..add('isLikedBy')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }

    if (value != null) {
      result
        ..add('description')
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
    value = object.subPosts;
    if (value != null) {
      result
        ..add('sub')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(PostModel)])));
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
  PostModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostModelBuilder();

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
        case 'featured_image':
          result.featuredImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'likes_count':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'comments_count':
          result.commentCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'addedImages':
          result.addedImages.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(File)]))!
              as BuiltList<Object?>);
          break;
        case 'slug':
          result.slug = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isLikedBy':
          result.isLikedBy = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'description':
          result.description = serializers.deserialize(
              (value as String).replaceAll('<br>', '\n'),
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sub':
          result.subPosts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PostModel)]))!
              as BuiltList<Object?>);
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
