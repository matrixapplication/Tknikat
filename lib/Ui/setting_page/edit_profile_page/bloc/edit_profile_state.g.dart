// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EditProfileState extends EditProfileState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final bool isCompleted;
  @override
  final bool success;
  @override
  final bool successSignup;
  @override
  final UserModel data;

  factory _$EditProfileState(
          [void Function(EditProfileStateBuilder)? updates]) =>
      (new EditProfileStateBuilder()..update(updates))._build();

  _$EditProfileState._(
      {this.error,
      required this.isLoading,
      required this.isCompleted,
      required this.success,
      required this.successSignup,
      required this.data})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'EditProfileState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isCompleted, r'EditProfileState', 'isCompleted');
    BuiltValueNullFieldError.checkNotNull(
        success, r'EditProfileState', 'success');
    BuiltValueNullFieldError.checkNotNull(
        successSignup, r'EditProfileState', 'successSignup');
    BuiltValueNullFieldError.checkNotNull(data, r'EditProfileState', 'data');
  }

  @override
  EditProfileState rebuild(void Function(EditProfileStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditProfileStateBuilder toBuilder() =>
      new EditProfileStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditProfileState &&
        error == other.error &&
        isLoading == other.isLoading &&
        isCompleted == other.isCompleted &&
        success == other.success &&
        successSignup == other.successSignup &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isCompleted.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, successSignup.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EditProfileState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('isCompleted', isCompleted)
          ..add('success', success)
          ..add('successSignup', successSignup)
          ..add('data', data))
        .toString();
  }
}

class EditProfileStateBuilder
    implements Builder<EditProfileState, EditProfileStateBuilder> {
  _$EditProfileState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isCompleted;
  bool? get isCompleted => _$this._isCompleted;
  set isCompleted(bool? isCompleted) => _$this._isCompleted = isCompleted;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _successSignup;
  bool? get successSignup => _$this._successSignup;
  set successSignup(bool? successSignup) =>
      _$this._successSignup = successSignup;

  UserModelBuilder? _data;
  UserModelBuilder get data => _$this._data ??= new UserModelBuilder();
  set data(UserModelBuilder? data) => _$this._data = data;

  EditProfileStateBuilder();

  EditProfileStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _isCompleted = $v.isCompleted;
      _success = $v.success;
      _successSignup = $v.successSignup;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditProfileState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EditProfileState;
  }

  @override
  void update(void Function(EditProfileStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EditProfileState build() => _build();

  _$EditProfileState _build() {
    _$EditProfileState _$result;
    try {
      _$result = _$v ??
          new _$EditProfileState._(
            error: error,
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'EditProfileState', 'isLoading'),
            isCompleted: BuiltValueNullFieldError.checkNotNull(
                isCompleted, r'EditProfileState', 'isCompleted'),
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'EditProfileState', 'success'),
            successSignup: BuiltValueNullFieldError.checkNotNull(
                successSignup, r'EditProfileState', 'successSignup'),
            data: data.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EditProfileState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
