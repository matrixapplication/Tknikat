// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RejectModel> _$rejectModelSerializer = new _$RejectModelSerializer();

class _$RejectModelSerializer implements StructuredSerializer<RejectModel> {
  @override
  final Iterable<Type> types = const [RejectModel, _$RejectModel];
  @override
  final String wireName = 'RejectModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, RejectModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'content',
      serializers.serialize(object.content,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  RejectModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RejectModelBuilder();

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
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RejectModel extends RejectModel {
  @override
  final int id;
  @override
  final String content;

  factory _$RejectModel([void Function(RejectModelBuilder)? updates]) =>
      (new RejectModelBuilder()..update(updates))._build();

  _$RejectModel._({required this.id, required this.content}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'RejectModel', 'id');
    BuiltValueNullFieldError.checkNotNull(content, r'RejectModel', 'content');
  }

  @override
  RejectModel rebuild(void Function(RejectModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RejectModelBuilder toBuilder() => new RejectModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RejectModel && id == other.id && content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RejectModel')
          ..add('id', id)
          ..add('content', content))
        .toString();
  }
}

class RejectModelBuilder implements Builder<RejectModel, RejectModelBuilder> {
  _$RejectModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  RejectModelBuilder();

  RejectModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _content = $v.content;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RejectModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RejectModel;
  }

  @override
  void update(void Function(RejectModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RejectModel build() => _build();

  _$RejectModel _build() {
    final _$result = _$v ??
        new _$RejectModel._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'RejectModel', 'id'),
          content: BuiltValueNullFieldError.checkNotNull(
              content, r'RejectModel', 'content'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
