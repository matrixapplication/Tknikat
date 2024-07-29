library notification;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializer/serializer.dart';

part 'notification_data.g.dart';

abstract class NotificationData
    implements Built<NotificationData, NotificationDataBuilder> {
  @BuiltValueField(wireName: "model_id")
  String get modalId;

  @BuiltValueField(wireName: "model_type")
  String get modalType;

  @BuiltValueField(wireName: "slug")
  String? get slug;

  @BuiltValueField(wireName: "denied")
  int? get denied;

  @BuiltValueField(wireName: "comment")
  String? get comment;

  NotificationData._();

  factory NotificationData([updates(NotificationDataBuilder b)]) =
      _$NotificationData;

  String toJson() {
    return json
        .encode(serializers.serializeWith(NotificationData.serializer, this));
  }

  static NotificationData fromJson(String jsonString) {
    return serializers.deserializeWith(
        NotificationData.serializer, json.decode(jsonString))!;
  }

  static Serializer<NotificationData> get serializer =>
      _$notificationDataSerializer;
}
