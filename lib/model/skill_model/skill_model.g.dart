// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SkillModel> _$skillModelSerializer = new _$SkillModelSerializer();

class _$SkillModelSerializer implements StructuredSerializer<SkillModel> {
  @override
  final Iterable<Type> types = const [SkillModel, _$SkillModel];
  @override
  final String wireName = 'SkillModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, SkillModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SkillModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SkillModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SkillModel extends SkillModel {
  @override
  final int id;
  @override
  final String? name;

  factory _$SkillModel([void Function(SkillModelBuilder)? updates]) =>
      (new SkillModelBuilder()..update(updates))._build();

  _$SkillModel._({required this.id, this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'SkillModel', 'id');
  }

  @override
  SkillModel rebuild(void Function(SkillModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SkillModelBuilder toBuilder() => new SkillModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SkillModel && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SkillModel')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class SkillModelBuilder implements Builder<SkillModel, SkillModelBuilder> {
  _$SkillModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  SkillModelBuilder();

  SkillModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SkillModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SkillModel;
  }

  @override
  void update(void Function(SkillModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SkillModel build() => _build();

  _$SkillModel _build() {
    final _$result = _$v ??
        new _$SkillModel._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'SkillModel', 'id'),
            name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
