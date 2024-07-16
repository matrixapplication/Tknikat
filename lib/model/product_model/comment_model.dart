library comment_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'comment_model.g.dart';

abstract class CommentModel
    implements Built<CommentModel, CommentModelBuilder> {
  int? get id;

  @BuiltValueField(wireName: "review")
  int? get review;

  @BuiltValueField(wireName: "review_content")
  String? get reviewContent;

  @BuiltValueField(wireName: "created_at")
  String? get dateCreated;

  @BuiltValueField(wireName: "user")
  UserModel? get user;

  @BuiltValueField(wireName: "parent_review")
  int? get rootCommentId;

  @BuiltValueField(wireName: "parent_user_id")
  int? get repliedUserId;

  @BuiltValueField(wireName: "parent_user")
  UserModel? get repliedUser;

  @BuiltValueField(wireName: "replies")
  BuiltList<CommentModel>? get replies;

  CommentModel._();

  factory CommentModel([updates(CommentModelBuilder b)]) = _$CommentModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CommentModel.serializer, this));
  }

  static CommentModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        CommentModel.serializer, json.decode(jsonString))!;
  }

  @BuiltValueSerializer(custom: true)
  static Serializer<CommentModel> get serializer =>
      _$CustomCommentModelSerializer();
}

class _$CustomCommentModelSerializer
    implements StructuredSerializer<CommentModel> {
  @override
  final Iterable<Type> types = const [CommentModel, _$CommentModel];
  @override
  final String wireName = 'CommentModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommentModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reviewContent;
    if (value != null) {
      result
        ..add('review_content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateCreated;
    if (value != null) {
      result
        ..add('created_at')
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
    value = object.rootCommentId;
    if (value != null) {
      result
        ..add('parent_review')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.repliedUserId;
    if (value != null) {
      result
        ..add('parent_user_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.repliedUser;
    if (value != null) {
      result
        ..add('parent_user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(UserModel)));
    }
    value = object.replies;
    if (value != null) {
      result
        ..add('replies')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CommentModel)])));
    }
    return result;
  }

  @override
  CommentModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentModelBuilder();

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
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'review_content':
          result.reviewContent = serializers.deserialize(
              (value as String).replaceAll('<br>', '\n'),
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.dateCreated = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserModel))! as UserModel);
          break;
        case 'parent_review':
          result.rootCommentId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'parent_user_id':
          result.repliedUserId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'parent_user':
          result.repliedUser.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserModel))! as UserModel);
          break;
        case 'replies':
          result.replies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CommentModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}
