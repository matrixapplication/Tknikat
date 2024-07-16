library country_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/city/city.dart';
import 'package:taknikat/model/serializer/serializer.dart';

part 'country_model.g.dart';

abstract class Country implements Built<Country, CountryBuilder> {
  int? get id;
  String? get name;
  String? get flag;
  BuiltList<City> get cities;

  Country._();

  factory Country([updates(CountryBuilder b)]) = _$Country;

  String toJson() {
    return json.encode(serializers.serializeWith(Country.serializer, this));
  }

  static Country fromJson(String jsonString) {
    return serializers.deserializeWith(
        Country.serializer, json.decode(jsonString))!;
  }

  static Serializer<Country> get serializer => _$countrySerializer;
}
