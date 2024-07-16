// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_services_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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

class _$GetAllServices extends GetAllServices {
  @override
  final CustomFilter customFilter;

  factory _$GetAllServices([void Function(GetAllServicesBuilder)? updates]) =>
      (new GetAllServicesBuilder()..update(updates))._build();

  _$GetAllServices._({required this.customFilter}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        customFilter, r'GetAllServices', 'customFilter');
  }

  @override
  GetAllServices rebuild(void Function(GetAllServicesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAllServicesBuilder toBuilder() =>
      new GetAllServicesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAllServices && customFilter == other.customFilter;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, customFilter.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetAllServices')
          ..add('customFilter', customFilter))
        .toString();
  }
}

class GetAllServicesBuilder
    implements Builder<GetAllServices, GetAllServicesBuilder> {
  _$GetAllServices? _$v;

  CustomFilter? _customFilter;
  CustomFilter? get customFilter => _$this._customFilter;
  set customFilter(CustomFilter? customFilter) =>
      _$this._customFilter = customFilter;

  GetAllServicesBuilder();

  GetAllServicesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _customFilter = $v.customFilter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAllServices other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAllServices;
  }

  @override
  void update(void Function(GetAllServicesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAllServices build() => _build();

  _$GetAllServices _build() {
    final _$result = _$v ??
        new _$GetAllServices._(
            customFilter: BuiltValueNullFieldError.checkNotNull(
                customFilter, r'GetAllServices', 'customFilter'));
    replace(_$result);
    return _$result;
  }
}

class _$GetNext extends GetNext {
  @override
  final CustomFilter customFilter;

  factory _$GetNext([void Function(GetNextBuilder)? updates]) =>
      (new GetNextBuilder()..update(updates))._build();

  _$GetNext._({required this.customFilter}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        customFilter, r'GetNext', 'customFilter');
  }

  @override
  GetNext rebuild(void Function(GetNextBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNextBuilder toBuilder() => new GetNextBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNext && customFilter == other.customFilter;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, customFilter.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetNext')
          ..add('customFilter', customFilter))
        .toString();
  }
}

class GetNextBuilder implements Builder<GetNext, GetNextBuilder> {
  _$GetNext? _$v;

  CustomFilter? _customFilter;
  CustomFilter? get customFilter => _$this._customFilter;
  set customFilter(CustomFilter? customFilter) =>
      _$this._customFilter = customFilter;

  GetNextBuilder();

  GetNextBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _customFilter = $v.customFilter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetNext other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNext;
  }

  @override
  void update(void Function(GetNextBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNext build() => _build();

  _$GetNext _build() {
    final _$result = _$v ??
        new _$GetNext._(
            customFilter: BuiltValueNullFieldError.checkNotNull(
                customFilter, r'GetNext', 'customFilter'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
