library paginator;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';

part 'paginator.g.dart';

abstract class Paginator implements Built<Paginator, PaginatorBuilder> {
  @BuiltValueField(wireName: "total_count")
  int? get totalCount;

  @BuiltValueField(wireName: "limit")
  int? get limit;

  @BuiltValueField(wireName: "total_page")
  int? get totalPage;

  @BuiltValueField(wireName: "current_page")
  int? get currentPage;

  Paginator._();

  factory Paginator([updates(PaginatorBuilder b)]) = _$Paginator;

  String toJson() {
    return json.encode(serializers.serializeWith(Paginator.serializer, this));
  }

  bool get isLastPage => currentPage == totalPage;

  static Paginator fromJson(String jsonString) {
    return serializers.deserializeWith(
        Paginator.serializer, json.decode(jsonString))!;
  }

  static Serializer<Paginator> get serializer => _$paginatorSerializer;
}
