// perm_model.dart

library perm_model;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'perm_model.g.dart';

abstract class PermModel implements Built<PermModel, PermModelBuilder> {
  String get key;
  String get label;

  @BuiltValueField(wireName: "has_count")
  bool get hasCount;

  int get count;

  PermModel._();
  factory PermModel([void Function(PermModelBuilder) updates]) = _$PermModel;

  static Serializer<PermModel> get serializer => _$permModelSerializer;
}
