library base_response;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/serializer/serializer.dart';

part 'base_response.g.dart';

abstract class BaseResponse<T>
    implements Built<BaseResponse<T>, BaseResponseBuilder<T>> {
  String? get result;
  T? get content;
  String? get error_des;
  int? get error_code;

  Paginator? get paginator;
  String? get images_prefix;

  BaseResponse._();

  factory BaseResponse([updates(BaseResponseBuilder<T> b)]) = _$BaseResponse<T>;

  String toJson() {
    return json
        .encode(serializers.serializeWith(BaseResponse.serializer, this));
  }

  static BaseResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        BaseResponse.serializer, json.decode(jsonString))!;
  }

  static Serializer<BaseResponse> get serializer => _$baseResponseSerializer;
}
