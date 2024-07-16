library reject_model;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';

part 'reject_model.g.dart';

abstract class RejectModel implements Built<RejectModel, RejectModelBuilder> {
  int get id;
  String get content;

  RejectModel._();

  factory RejectModel([void Function(RejectModelBuilder) updates]) = _$RejectModel;

  String toJson() {
    return json.encode(serializers.serializeWith(RejectModel.serializer, this));
  }

  static RejectModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        RejectModel.serializer, json.decode(jsonString))!;
  }

  static Serializer<RejectModel> get serializer => _$rejectModelSerializer;
}
