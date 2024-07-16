library notification;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializer/serializer.dart';
import 'notification_data.dart';

part 'notification.g.dart';

abstract class Notification
    implements Built<Notification, NotificationBuilder> {
  int? get id;
  @BuiltValueField(wireName: "user_id")
  int? get userId;
  String? get title;
  String? get message;
  @BuiltValueField(wireName: "created_at")
  String? get createdAt;

  @BuiltValueField(wireName: "image")
  String? get image;

  @BuiltValueField(wireName: "user_name")
  String? get userName;

  NotificationData? get data;

  int? get read;

  Notification._();

  factory Notification([updates(NotificationBuilder b)]) = _$Notification;

  String toJson() {
    return json
        .encode(serializers.serializeWith(Notification.serializer, this));
  }

  static Notification fromJson(String jsonString) {
    return serializers.deserializeWith(
        Notification.serializer, json.decode(jsonString))!;
  }
  @BuiltValueSerializer(custom: true)

  static Serializer<Notification> get serializer => _$CustomNotificationSerializer();
}

class _$CustomNotificationSerializer implements StructuredSerializer<Notification> {
  @override
  final Iterable<Type> types = const [Notification, _$Notification];
  @override
  final String wireName = 'Notification';

  @override
  Iterable<Object?> serialize(Serializers serializers, Notification object,
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
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NotificationData)));
    }
    value = object.read;
    if (value != null) {
      result
        ..add('read')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Notification deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationBuilder();

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
        case 'title':
          result.title  = serializers.deserialize(
              (value as String).replaceAll('<br>', '\n'),
              specifiedType: const FullType(String)) as String?;
          break;
        case 'message':
          result.message  = serializers.deserialize(
              (value as String).replaceAll('<br>', '\n'),
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(NotificationData))!
          as NotificationData);
          break;
        case 'read':
          result.read = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

