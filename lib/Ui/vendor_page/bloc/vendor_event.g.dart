// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_event.dart';

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

class _$GetVendorData extends GetVendorData {
  @override
  final UserModel vendor;

  factory _$GetVendorData([void Function(GetVendorDataBuilder)? updates]) =>
      (new GetVendorDataBuilder()..update(updates))._build();

  _$GetVendorData._({required this.vendor}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vendor, r'GetVendorData', 'vendor');
  }

  @override
  GetVendorData rebuild(void Function(GetVendorDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetVendorDataBuilder toBuilder() => new GetVendorDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetVendorData && vendor == other.vendor;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vendor.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetVendorData')
          ..add('vendor', vendor))
        .toString();
  }
}

class GetVendorDataBuilder
    implements Builder<GetVendorData, GetVendorDataBuilder> {
  _$GetVendorData? _$v;

  UserModelBuilder? _vendor;
  UserModelBuilder get vendor => _$this._vendor ??= new UserModelBuilder();
  set vendor(UserModelBuilder? vendor) => _$this._vendor = vendor;

  GetVendorDataBuilder();

  GetVendorDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vendor = $v.vendor.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetVendorData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetVendorData;
  }

  @override
  void update(void Function(GetVendorDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetVendorData build() => _build();

  _$GetVendorData _build() {
    _$GetVendorData _$result;
    try {
      _$result = _$v ??
          new _$GetVendorData._(
            vendor: vendor.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vendor';
        vendor.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetVendorData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GetVendorEvents extends GetVendorEvents {
  @override
  final int id;

  factory _$GetVendorEvents([void Function(GetVendorEventsBuilder)? updates]) =>
      (new GetVendorEventsBuilder()..update(updates))._build();

  _$GetVendorEvents._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GetVendorEvents', 'id');
  }

  @override
  GetVendorEvents rebuild(void Function(GetVendorEventsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetVendorEventsBuilder toBuilder() =>
      new GetVendorEventsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetVendorEvents && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetVendorEvents')..add('id', id))
        .toString();
  }
}

class GetVendorEventsBuilder
    implements Builder<GetVendorEvents, GetVendorEventsBuilder> {
  _$GetVendorEvents? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  GetVendorEventsBuilder();

  GetVendorEventsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetVendorEvents other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetVendorEvents;
  }

  @override
  void update(void Function(GetVendorEventsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetVendorEvents build() => _build();

  _$GetVendorEvents _build() {
    final _$result = _$v ??
        new _$GetVendorEvents._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GetVendorEvents', 'id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
