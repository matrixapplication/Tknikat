library event_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'event_model.g.dart';

abstract class EventModel implements Built<EventModel, EventModelBuilder> {
  int? get id;

  EventStatus? get status;

  @BuiltValueField(wireName: "share_count")
  int? get shareCount;

  String? get name;

  @BuiltValueField(wireName: "raw_description")
  String? get description;

  @BuiltValueField(wireName: "featured_image")
  String? get image;

  @BuiltValueField(wireName: "end_date")
  String? get endDate;
  @BuiltValueField(wireName: "activations_count")
  int? get activationsCount;
  @BuiltValueField(wireName: "user_share")
  int? get userShare;

  @BuiltValueField(wireName: "start_date")
  String? get startDate;

  @BuiltValueField(wireName: "created_at")
  String? get createdAt;

  bool? get started;

  bool? get expired;

  UserModel? get creator;

  EventModel._();

  factory EventModel([updates(EventModelBuilder b)]) = _$EventModel;

  String toJson() {
    return json.encode(serializers.serializeWith(EventModel.serializer, this));
  }

  static EventModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        EventModel.serializer, json.decode(jsonString))!;
  }
  @BuiltValueSerializer(custom: true)
  static Serializer<EventModel> get serializer => _$CustomEventModelSerializer();
}

class EventStatus extends EnumClass {
  static Serializer<EventStatus> get serializer => _$eventStatusSerializer;
  @BuiltValueEnumConst(wireNumber: 1)
  static const EventStatus approved = _$approved;
  @BuiltValueEnumConst(wireNumber: 2)
  static const EventStatus unApproved = _$unApproved;
  @BuiltValueEnumConst(wireNumber: 3)
  static const EventStatus pending = _$pending;

  const EventStatus._(String name) : super(name);

  static BuiltSet<EventStatus> get values => _$values;

  static EventStatus valueOf(String name) => _$valueOf(name);
}


class _$CustomEventModelSerializer implements StructuredSerializer<EventModel> {
  @override
  final Iterable<Type> types = const [EventModel, _$EventModel];
  @override
  final String wireName = 'EventModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, EventModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;

    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EventStatus)));
    }
    value = object.shareCount;
    if (value != null) {
      result
        ..add('share_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
    value = object.description;
    if (value != null) {
      result
        ..add('raw_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('featured_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('end_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.activationsCount;
    if (value != null) {
      result
        ..add('activations_count')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userShare;
    if (value != null) {
      result
        ..add('user_share')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.startDate;
    if (value != null) {
      result
        ..add('start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.started;
    if (value != null) {
      result
        ..add('started')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.expired;
    if (value != null) {
      result
        ..add('expired')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.creator;
    if (value != null) {
      result
        ..add('creator')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(UserModel)));
    }
    return result;
  }

  @override
  EventModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventModelBuilder();

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
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(EventStatus)) as EventStatus?;
          break;
        case 'share_count':
          result.shareCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
          case 'activations_count':
          result.activationsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
          case 'user_share':
          result.userShare = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'raw_description':
          result.description = serializers.deserialize(
              (value as String).replaceAll('<br>', '\n'),
              specifiedType: const FullType(String)) as String?;
          break;
        case 'featured_image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'end_date':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
          case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'started':
          result.started = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'expired':
          result.expired = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'creator':
          result.creator.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserModel))! as UserModel);
          break;
      }
    }

    return result.build();
  }
}
