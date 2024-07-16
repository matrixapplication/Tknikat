library city;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';

part 'city.g.dart';

abstract class City implements Built<City, CityBuilder> {
  int? get id;
  int? get country_id;
  String? get name;

  City._();

  factory City([updates(CityBuilder b)]) = _$City;

  String toJson() {
    return json.encode(serializers.serializeWith(City.serializer, this));
  }

  static City fromJson(String jsonString) {
    return serializers.deserializeWith(
        City.serializer, json.decode(jsonString))!;
  }

  static Serializer<City> get serializer => _$citySerializer;
}
