library share_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/serializer/serializer.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'share_model.g.dart';

abstract class ShareModel implements Built<ShareModel, ShareModelBuilder> {
  int get id;

  @BuiltValueField(wireName: "is_approved")
  ShareStatus get status;

  @BuiltValueField(wireName: "denied_option")
  int? get deniedOption;

  int get views;

  @BuiltValueField(wireName: "reviews_count")
  int? get reviewsCount;

  @BuiltValueField(wireName: "user_name")
  String get userName;

  String? get description;

  String get image;

  UserModel get user;

  @BuiltValueField(wireName: "created_at")
  String get createdAt;

  EventModel? get event;

  ShareModel._();

  factory ShareModel([updates(ShareModelBuilder b)]) = _$ShareModel;

  String toJson() {
    return json.encode(serializers.serializeWith(ShareModel.serializer, this));
  }

  static ShareModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        ShareModel.serializer, json.decode(jsonString))!;
  }

  @BuiltValueSerializer(custom: true)
  static Serializer<ShareModel> get serializer =>
      _$CustomShareModelSerializer();
}

class _$CustomShareModelSerializer implements StructuredSerializer<ShareModel> {
  @override
  final Iterable<Type> types = const [ShareModel, _$ShareModel];
  @override
  final String wireName = 'ShareModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ShareModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'is_approved',
      serializers.serialize(object.status,
          specifiedType: const FullType(ShareStatus)),
      'views',
      serializers.serialize(object.views, specifiedType: const FullType(int)),
      'user_name',
      serializers.serialize(object.userName,
          specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(UserModel)),
    ];
    Object? value;
    value = object.deniedOption;
    if (value != null) {
      result
        ..add('denied_option')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reviewsCount;
    if (value != null) {
      result
        ..add('reviews_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.event;
    if (value != null) {
      result
        ..add('event')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EventModel)));
    }
    return result;
  }

  @override
  ShareModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShareModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'is_approved':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(ShareStatus))! as ShareStatus;
          break;
        case 'denied_option':
          result.deniedOption = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;

        case 'views':
          result.views = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'reviews_count':
          result.reviewsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(
              (value as String).replaceAll('<br>', '\n'),
              specifiedType: const FullType(String)) as String?;
          ;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
          case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserModel))! as UserModel);
          break;
        case 'event':
          result.event.replace(serializers.deserialize(value,
              specifiedType: const FullType(EventModel))! as EventModel);
          break;
      }
    }

    return result.build();
  }
}

class ShareStatus extends EnumClass {
  static Serializer<ShareStatus> get serializer => _$shareStatusSerializer;
  @BuiltValueEnumConst(wireNumber: 0)
  static const ShareStatus unapproved = _$unApproved;
  @BuiltValueEnumConst(wireNumber: 1)
  static const ShareStatus approved = _$approved;
  @BuiltValueEnumConst(wireNumber: 2)
  static const ShareStatus pending = _$pending;

  const ShareStatus._(String name) : super(name);

  static BuiltSet<ShareStatus> get values => _$values;

  static ShareStatus valueOf(String name) => _$valueOf(name);
}
