// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReportModel> _$reportModelSerializer = new _$ReportModelSerializer();

class _$ReportModelSerializer implements StructuredSerializer<ReportModel> {
  @override
  final Iterable<Type> types = const [ReportModel, _$ReportModel];
  @override
  final String wireName = 'ReportModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReportModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'content',
      serializers.serialize(object.content,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ReportModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReportModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ReportModel extends ReportModel {
  @override
  final String content;
  @override
  final int id;

  factory _$ReportModel([void Function(ReportModelBuilder)? updates]) =>
      (new ReportModelBuilder()..update(updates))._build();

  _$ReportModel._({required this.content, required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(content, r'ReportModel', 'content');
    BuiltValueNullFieldError.checkNotNull(id, r'ReportModel', 'id');
  }

  @override
  ReportModel rebuild(void Function(ReportModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportModelBuilder toBuilder() => new ReportModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportModel && content == other.content && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportModel')
          ..add('content', content)
          ..add('id', id))
        .toString();
  }
}

class ReportModelBuilder implements Builder<ReportModel, ReportModelBuilder> {
  _$ReportModel? _$v;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  ReportModelBuilder();

  ReportModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _content = $v.content;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportModel;
  }

  @override
  void update(void Function(ReportModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportModel build() => _build();

  _$ReportModel _build() {
    final _$result = _$v ??
        new _$ReportModel._(
          content: BuiltValueNullFieldError.checkNotNull(
              content, r'ReportModel', 'content'),
          id: BuiltValueNullFieldError.checkNotNull(id, r'ReportModel', 'id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
