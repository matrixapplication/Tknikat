// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitHome extends InitHome {
  factory _$InitHome([void Function(InitHomeBuilder)? updates]) =>
      (new InitHomeBuilder()..update(updates))._build();

  _$InitHome._() : super._();

  @override
  InitHome rebuild(void Function(InitHomeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitHomeBuilder toBuilder() => new InitHomeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitHome;
  }

  @override
  int get hashCode {
    return 117828530;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'InitHome').toString();
  }
}

class InitHomeBuilder implements Builder<InitHome, InitHomeBuilder> {
  _$InitHome? _$v;

  InitHomeBuilder();

  @override
  void replace(InitHome other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitHome;
  }

  @override
  void update(void Function(InitHomeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitHome build() => _build();

  _$InitHome _build() {
    final _$result = _$v ?? new _$InitHome._();
    replace(_$result);
    return _$result;
  }
}

class _$ClearError extends ClearError {
  factory _$ClearError([void Function(ClearErrorBuilder)? updates]) =>
      (new ClearErrorBuilder()..update(updates))._build();

  _$ClearError._() : super._();

  @override
  ClearError rebuild(void Function(ClearErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearErrorBuilder toBuilder() => new ClearErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearError;
  }

  @override
  int get hashCode {
    return 507656265;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearError').toString();
  }
}

class ClearErrorBuilder implements Builder<ClearError, ClearErrorBuilder> {
  _$ClearError? _$v;

  ClearErrorBuilder();

  @override
  void replace(ClearError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearError;
  }

  @override
  void update(void Function(ClearErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearError build() => _build();

  _$ClearError _build() {
    final _$result = _$v ?? new _$ClearError._();
    replace(_$result);
    return _$result;
  }
}

class _$GetLanguage extends GetLanguage {
  factory _$GetLanguage([void Function(GetLanguageBuilder)? updates]) =>
      (new GetLanguageBuilder()..update(updates))._build();

  _$GetLanguage._() : super._();

  @override
  GetLanguage rebuild(void Function(GetLanguageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetLanguageBuilder toBuilder() => new GetLanguageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetLanguage;
  }

  @override
  int get hashCode {
    return 22165669;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetLanguage').toString();
  }
}

class GetLanguageBuilder implements Builder<GetLanguage, GetLanguageBuilder> {
  _$GetLanguage? _$v;

  GetLanguageBuilder();

  @override
  void replace(GetLanguage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetLanguage;
  }

  @override
  void update(void Function(GetLanguageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetLanguage build() => _build();

  _$GetLanguage _build() {
    final _$result = _$v ?? new _$GetLanguage._();
    replace(_$result);
    return _$result;
  }
}

class _$GetAllProducts extends GetAllProducts {
  @override
  final int is_new;

  factory _$GetAllProducts([void Function(GetAllProductsBuilder)? updates]) =>
      (new GetAllProductsBuilder()..update(updates))._build();

  _$GetAllProducts._({required this.is_new}) : super._() {
    BuiltValueNullFieldError.checkNotNull(is_new, r'GetAllProducts', 'is_new');
  }

  @override
  GetAllProducts rebuild(void Function(GetAllProductsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAllProductsBuilder toBuilder() =>
      new GetAllProductsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAllProducts && is_new == other.is_new;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, is_new.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetAllProducts')
          ..add('is_new', is_new))
        .toString();
  }
}

class GetAllProductsBuilder
    implements Builder<GetAllProducts, GetAllProductsBuilder> {
  _$GetAllProducts? _$v;

  int? _is_new;
  int? get is_new => _$this._is_new;
  set is_new(int? is_new) => _$this._is_new = is_new;

  GetAllProductsBuilder();

  GetAllProductsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _is_new = $v.is_new;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAllProducts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAllProducts;
  }

  @override
  void update(void Function(GetAllProductsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAllProducts build() => _build();

  _$GetAllProducts _build() {
    final _$result = _$v ??
        new _$GetAllProducts._(
            is_new: BuiltValueNullFieldError.checkNotNull(
                is_new, r'GetAllProducts', 'is_new'));
    replace(_$result);
    return _$result;
  }
}

class _$ChangeStatus extends ChangeStatus {
  factory _$ChangeStatus([void Function(ChangeStatusBuilder)? updates]) =>
      (new ChangeStatusBuilder()..update(updates))._build();

  _$ChangeStatus._() : super._();

  @override
  ChangeStatus rebuild(void Function(ChangeStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeStatusBuilder toBuilder() => new ChangeStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeStatus;
  }

  @override
  int get hashCode {
    return 20091075;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ChangeStatus').toString();
  }
}

class ChangeStatusBuilder
    implements Builder<ChangeStatus, ChangeStatusBuilder> {
  _$ChangeStatus? _$v;

  ChangeStatusBuilder();

  @override
  void replace(ChangeStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeStatus;
  }

  @override
  void update(void Function(ChangeStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeStatus build() => _build();

  _$ChangeStatus _build() {
    final _$result = _$v ?? new _$ChangeStatus._();
    replace(_$result);
    return _$result;
  }
}

class _$GetFilter extends GetFilter {
  @override
  final String type;

  factory _$GetFilter([void Function(GetFilterBuilder)? updates]) =>
      (new GetFilterBuilder()..update(updates))._build();

  _$GetFilter._({required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'GetFilter', 'type');
  }

  @override
  GetFilter rebuild(void Function(GetFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetFilterBuilder toBuilder() => new GetFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetFilter && type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetFilter')..add('type', type))
        .toString();
  }
}

class GetFilterBuilder implements Builder<GetFilter, GetFilterBuilder> {
  _$GetFilter? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GetFilterBuilder();

  GetFilterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetFilter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetFilter;
  }

  @override
  void update(void Function(GetFilterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetFilter build() => _build();

  _$GetFilter _build() {
    final _$result = _$v ??
        new _$GetFilter._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'GetFilter', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
