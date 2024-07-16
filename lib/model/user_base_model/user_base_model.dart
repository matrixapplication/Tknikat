library user_base_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'user_base_model.g.dart';

abstract class UserBaseModel
    implements Built<UserBaseModel, UserBaseModelBuilder> {
  @BuiltValueField(wireName: "token")
  String? get token;
  @BuiltValueField(wireName: "user")
  UserModel? get user;
  UserBaseModel._();

  factory UserBaseModel([updates(UserBaseModelBuilder b)]) = _$UserBaseModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(UserBaseModel.serializer, this));
  }

  static UserBaseModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserBaseModel.serializer, json.decode(jsonString))!;
  }

  static Serializer<UserBaseModel> get serializer => _$userBaseModelSerializer;
}
