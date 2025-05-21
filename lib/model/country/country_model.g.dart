// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Country> _$countrySerializer = new _$CountrySerializer();

class _$CountrySerializer implements StructuredSerializer<Country> {
  @override
  final Iterable<Type> types = const [Country, _$Country];
  @override
  final String wireName = 'Country';

  @override
  Iterable<Object?> serialize(Serializers serializers, Country object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'cities',
      serializers.serialize(object.cities,
          specifiedType:
              const FullType(BuiltList, const [const FullType(City)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.flag;
    if (value != null) {
      result
        ..add('flag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Country deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CountryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'flag':
          result.flag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cities':
          result.cities.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(City)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Country extends Country {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? flag;
  @override
  final BuiltList<City> cities;

  factory _$Country([void Function(CountryBuilder)? updates]) =>
      (new CountryBuilder()..update(updates))._build();

  _$Country._({this.id, this.name, this.flag, required this.cities})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(cities, r'Country', 'cities');
  }

  @override
  Country rebuild(void Function(CountryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountryBuilder toBuilder() => new CountryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Country &&
        id == other.id &&
        name == other.name &&
        flag == other.flag &&
        cities == other.cities;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, flag.hashCode);
    _$hash = $jc(_$hash, cities.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Country')
          ..add('id', id)
          ..add('name', name)
          ..add('flag', flag)
          ..add('cities', cities))
        .toString();
  }
}

class CountryBuilder implements Builder<Country, CountryBuilder> {
  _$Country? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _flag;
  String? get flag => _$this._flag;
  set flag(String? flag) => _$this._flag = flag;

  ListBuilder<City>? _cities;
  ListBuilder<City> get cities => _$this._cities ??= new ListBuilder<City>();
  set cities(ListBuilder<City>? cities) => _$this._cities = cities;

  CountryBuilder();

  CountryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _flag = $v.flag;
      _cities = $v.cities.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Country other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Country;
  }

  @override
  void update(void Function(CountryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Country build() => _build();

  _$Country _build() {
    _$Country _$result;
    try {
      _$result = _$v ??
          new _$Country._(
            id: id,
            name: name,
            flag: flag,
            cities: cities.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cities';
        cities.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Country', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
