// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthState extends AuthState {
  @override
  final String? error;
  @override
  final String? email;
  @override
  final bool isLoading;
  @override
  final bool success;
  @override
  final bool successSignup;
  @override
  final bool successComplete;
  @override
  final bool successVerfy;
  @override
  final bool successForget;
  @override
  final UserModel user;

  factory _$AuthState([void Function(AuthStateBuilder)? updates]) =>
      (new AuthStateBuilder()..update(updates))._build();

  _$AuthState._(
      {this.error,
      this.email,
      required this.isLoading,
      required this.success,
      required this.successSignup,
      required this.successComplete,
      required this.successVerfy,
      required this.successForget,
      required this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(isLoading, r'AuthState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(success, r'AuthState', 'success');
    BuiltValueNullFieldError.checkNotNull(
        successSignup, r'AuthState', 'successSignup');
    BuiltValueNullFieldError.checkNotNull(
        successComplete, r'AuthState', 'successComplete');
    BuiltValueNullFieldError.checkNotNull(
        successVerfy, r'AuthState', 'successVerfy');
    BuiltValueNullFieldError.checkNotNull(
        successForget, r'AuthState', 'successForget');
    BuiltValueNullFieldError.checkNotNull(user, r'AuthState', 'user');
  }

  @override
  AuthState rebuild(void Function(AuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthStateBuilder toBuilder() => new AuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthState &&
        error == other.error &&
        email == other.email &&
        isLoading == other.isLoading &&
        success == other.success &&
        successSignup == other.successSignup &&
        successComplete == other.successComplete &&
        successVerfy == other.successVerfy &&
        successForget == other.successForget &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, successSignup.hashCode);
    _$hash = $jc(_$hash, successComplete.hashCode);
    _$hash = $jc(_$hash, successVerfy.hashCode);
    _$hash = $jc(_$hash, successForget.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthState')
          ..add('error', error)
          ..add('email', email)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('successSignup', successSignup)
          ..add('successComplete', successComplete)
          ..add('successVerfy', successVerfy)
          ..add('successForget', successForget)
          ..add('user', user))
        .toString();
  }
}

class AuthStateBuilder implements Builder<AuthState, AuthStateBuilder> {
  _$AuthState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _successSignup;
  bool? get successSignup => _$this._successSignup;
  set successSignup(bool? successSignup) =>
      _$this._successSignup = successSignup;

  bool? _successComplete;
  bool? get successComplete => _$this._successComplete;
  set successComplete(bool? successComplete) =>
      _$this._successComplete = successComplete;

  bool? _successVerfy;
  bool? get successVerfy => _$this._successVerfy;
  set successVerfy(bool? successVerfy) => _$this._successVerfy = successVerfy;

  bool? _successForget;
  bool? get successForget => _$this._successForget;
  set successForget(bool? successForget) =>
      _$this._successForget = successForget;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  AuthStateBuilder();

  AuthStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _email = $v.email;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _successSignup = $v.successSignup;
      _successComplete = $v.successComplete;
      _successVerfy = $v.successVerfy;
      _successForget = $v.successForget;
      _user = $v.user.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthState;
  }

  @override
  void update(void Function(AuthStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthState build() => _build();

  _$AuthState _build() {
    _$AuthState _$result;
    try {
      _$result = _$v ??
          new _$AuthState._(
            error: error,
            email: email,
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'AuthState', 'isLoading'),
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'AuthState', 'success'),
            successSignup: BuiltValueNullFieldError.checkNotNull(
                successSignup, r'AuthState', 'successSignup'),
            successComplete: BuiltValueNullFieldError.checkNotNull(
                successComplete, r'AuthState', 'successComplete'),
            successVerfy: BuiltValueNullFieldError.checkNotNull(
                successVerfy, r'AuthState', 'successVerfy'),
            successForget: BuiltValueNullFieldError.checkNotNull(
                successForget, r'AuthState', 'successForget'),
            user: user.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
