// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perm_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PermModel> _$permModelSerializer = new _$PermModelSerializer();

class _$PermModelSerializer implements StructuredSerializer<PermModel> {
  @override
  final Iterable<Type> types = const [PermModel, _$PermModel];
  @override
  final String wireName = 'PermModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, PermModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
      'label',
      serializers.serialize(object.label,
          specifiedType: const FullType(String)),
      'has_count',
      serializers.serialize(object.hasCount,
          specifiedType: const FullType(bool)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  PermModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PermModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'has_count':
          result.hasCount = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PermModel extends PermModel {
  @override
  final String key;
  @override
  final String label;
  @override
  final bool hasCount;
  @override
  final int count;

  factory _$PermModel([void Function(PermModelBuilder)? updates]) =>
      (new PermModelBuilder()..update(updates))._build();

  _$PermModel._(
      {required this.key,
      required this.label,
      required this.hasCount,
      required this.count})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(key, r'PermModel', 'key');
    BuiltValueNullFieldError.checkNotNull(label, r'PermModel', 'label');
    BuiltValueNullFieldError.checkNotNull(hasCount, r'PermModel', 'hasCount');
    BuiltValueNullFieldError.checkNotNull(count, r'PermModel', 'count');
  }

  @override
  PermModel rebuild(void Function(PermModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PermModelBuilder toBuilder() => new PermModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PermModel &&
        key == other.key &&
        label == other.label &&
        hasCount == other.hasCount &&
        count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, hasCount.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PermModel')
          ..add('key', key)
          ..add('label', label)
          ..add('hasCount', hasCount)
          ..add('count', count))
        .toString();
  }
}

class PermModelBuilder implements Builder<PermModel, PermModelBuilder> {
  _$PermModel? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  bool? _hasCount;
  bool? get hasCount => _$this._hasCount;
  set hasCount(bool? hasCount) => _$this._hasCount = hasCount;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  PermModelBuilder();

  PermModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _label = $v.label;
      _hasCount = $v.hasCount;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PermModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PermModel;
  }

  @override
  void update(void Function(PermModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PermModel build() => _build();

  _$PermModel _build() {
    final _$result = _$v ??
        new _$PermModel._(
          key: BuiltValueNullFieldError.checkNotNull(key, r'PermModel', 'key'),
          label: BuiltValueNullFieldError.checkNotNull(
              label, r'PermModel', 'label'),
          hasCount: BuiltValueNullFieldError.checkNotNull(
              hasCount, r'PermModel', 'hasCount'),
          count: BuiltValueNullFieldError.checkNotNull(
              count, r'PermModel', 'count'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
