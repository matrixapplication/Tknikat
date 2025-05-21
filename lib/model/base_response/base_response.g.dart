// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BaseResponse<Object?>> _$baseResponseSerializer =
    new _$BaseResponseSerializer();

class _$BaseResponseSerializer
    implements StructuredSerializer<BaseResponse<Object?>> {
  @override
  final Iterable<Type> types = const [BaseResponse, _$BaseResponse];
  @override
  final String wireName = 'BaseResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, BaseResponse<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[];
    Object? value;
    value = object.result;
    if (value != null) {
      result
        ..add('result')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value, specifiedType: parameterT));
    }
    value = object.error_des;
    if (value != null) {
      result
        ..add('error_des')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.error_code;
    if (value != null) {
      result
        ..add('error_code')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.paginator;
    if (value != null) {
      result
        ..add('paginator')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Paginator)));
    }
    value = object.images_prefix;
    if (value != null) {
      result
        ..add('images_prefix')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BaseResponse<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new BaseResponseBuilder<Object?>()
        : serializers.newBuilder(specifiedType) as BaseResponseBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'result':
          result.result = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content':
          result.content =
              serializers.deserialize(value, specifiedType: parameterT);
          break;
        case 'error_des':
          result.error_des = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'error_code':
          result.error_code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'paginator':
          result.paginator.replace(serializers.deserialize(value,
              specifiedType: const FullType(Paginator))! as Paginator);
          break;
        case 'images_prefix':
          result.images_prefix = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$BaseResponse<T> extends BaseResponse<T> {
  @override
  final String? result;
  @override
  final T? content;
  @override
  final String? error_des;
  @override
  final int? error_code;
  @override
  final Paginator? paginator;
  @override
  final String? images_prefix;

  factory _$BaseResponse([void Function(BaseResponseBuilder<T>)? updates]) =>
      (new BaseResponseBuilder<T>()..update(updates))._build();

  _$BaseResponse._(
      {this.result,
      this.content,
      this.error_des,
      this.error_code,
      this.paginator,
      this.images_prefix})
      : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'BaseResponse', 'T');
    }
  }

  @override
  BaseResponse<T> rebuild(void Function(BaseResponseBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaseResponseBuilder<T> toBuilder() =>
      new BaseResponseBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaseResponse &&
        result == other.result &&
        content == other.content &&
        error_des == other.error_des &&
        error_code == other.error_code &&
        paginator == other.paginator &&
        images_prefix == other.images_prefix;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, result.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, error_des.hashCode);
    _$hash = $jc(_$hash, error_code.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jc(_$hash, images_prefix.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BaseResponse')
          ..add('result', result)
          ..add('content', content)
          ..add('error_des', error_des)
          ..add('error_code', error_code)
          ..add('paginator', paginator)
          ..add('images_prefix', images_prefix))
        .toString();
  }
}

class BaseResponseBuilder<T>
    implements Builder<BaseResponse<T>, BaseResponseBuilder<T>> {
  _$BaseResponse<T>? _$v;

  String? _result;
  String? get result => _$this._result;
  set result(String? result) => _$this._result = result;

  T? _content;
  T? get content => _$this._content;
  set content(T? content) => _$this._content = content;

  String? _error_des;
  String? get error_des => _$this._error_des;
  set error_des(String? error_des) => _$this._error_des = error_des;

  int? _error_code;
  int? get error_code => _$this._error_code;
  set error_code(int? error_code) => _$this._error_code = error_code;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  String? _images_prefix;
  String? get images_prefix => _$this._images_prefix;
  set images_prefix(String? images_prefix) =>
      _$this._images_prefix = images_prefix;

  BaseResponseBuilder();

  BaseResponseBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _result = $v.result;
      _content = $v.content;
      _error_des = $v.error_des;
      _error_code = $v.error_code;
      _paginator = $v.paginator?.toBuilder();
      _images_prefix = $v.images_prefix;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BaseResponse<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BaseResponse<T>;
  }

  @override
  void update(void Function(BaseResponseBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BaseResponse<T> build() => _build();

  _$BaseResponse<T> _build() {
    _$BaseResponse<T> _$result;
    try {
      _$result = _$v ??
          new _$BaseResponse<T>._(
            result: result,
            content: content,
            error_des: error_des,
            error_code: error_code,
            paginator: _paginator?.build(),
            images_prefix: images_prefix,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'paginator';
        _paginator?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BaseResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
