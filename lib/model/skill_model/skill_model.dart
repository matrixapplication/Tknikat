library skill_model;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';

part 'skill_model.g.dart';

abstract class SkillModel implements Built<SkillModel, SkillModelBuilder> {
  // fields go here
  int get id;
  String? get name;
  SkillModel._();

  factory SkillModel([updates(SkillModelBuilder b)]) = _$SkillModel;

  String toJson() {
    return json.encode(serializers.serializeWith(SkillModel.serializer, this));
  }

  static SkillModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        SkillModel.serializer, json.decode(jsonString))!;
  }

  static Serializer<SkillModel> get serializer => _$skillModelSerializer;
}
