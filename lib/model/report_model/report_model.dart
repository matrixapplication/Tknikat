library report_model;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';

part 'report_model.g.dart';

abstract class ReportModel implements Built<ReportModel, ReportModelBuilder> {
  String get content;
  int get id;

  ReportModel._();

  factory ReportModel([updates(ReportModelBuilder b)]) = _$ReportModel;

  String toJson() {
    return json.encode(serializers.serializeWith(ReportModel.serializer, this));
  }

  static ReportModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        ReportModel.serializer, json.decode(jsonString))!;
  }

  static Serializer<ReportModel> get serializer => _$reportModelSerializer;
}
