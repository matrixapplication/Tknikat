// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactus_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ContactUsState extends ContactUsState {
  @override
  final String? error;
  @override
  final bool isLoading;

  factory _$ContactUsState([void Function(ContactUsStateBuilder)? updates]) =>
      (new ContactUsStateBuilder()..update(updates))._build();

  _$ContactUsState._({this.error, required this.isLoading}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'ContactUsState', 'isLoading');
  }

  @override
  ContactUsState rebuild(void Function(ContactUsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactUsStateBuilder toBuilder() =>
      new ContactUsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactUsState &&
        error == other.error &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactUsState')
          ..add('error', error)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class ContactUsStateBuilder
    implements Builder<ContactUsState, ContactUsStateBuilder> {
  _$ContactUsState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  ContactUsStateBuilder();

  ContactUsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactUsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactUsState;
  }

  @override
  void update(void Function(ContactUsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactUsState build() => _build();

  _$ContactUsState _build() {
    final _$result = _$v ??
        new _$ContactUsState._(
            error: error,
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'ContactUsState', 'isLoading'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
