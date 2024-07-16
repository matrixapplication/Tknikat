// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final bool loginState;
  @override
  final String appLanguage;
  @override
  final bool initialized;
  @override
  final UserModel user;

  factory _$AppState([void Function(AppStateBuilder)? updates]) =>
      (new AppStateBuilder()..update(updates))._build();

  _$AppState._(
      {required this.loginState,
      required this.appLanguage,
      required this.initialized,
      required this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        loginState, r'AppState', 'loginState');
    BuiltValueNullFieldError.checkNotNull(
        appLanguage, r'AppState', 'appLanguage');
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'AppState', 'initialized');
    BuiltValueNullFieldError.checkNotNull(user, r'AppState', 'user');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        loginState == other.loginState &&
        appLanguage == other.appLanguage &&
        initialized == other.initialized &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, loginState.hashCode);
    _$hash = $jc(_$hash, appLanguage.hashCode);
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppState')
          ..add('loginState', loginState)
          ..add('appLanguage', appLanguage)
          ..add('initialized', initialized)
          ..add('user', user))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState? _$v;

  bool? _loginState;
  bool? get loginState => _$this._loginState;
  set loginState(bool? loginState) => _$this._loginState = loginState;

  String? _appLanguage;
  String? get appLanguage => _$this._appLanguage;
  set appLanguage(String? appLanguage) => _$this._appLanguage = appLanguage;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _loginState = $v.loginState;
      _appLanguage = $v.appLanguage;
      _initialized = $v.initialized;
      _user = $v.user.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppState build() => _build();

  _$AppState _build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              loginState: BuiltValueNullFieldError.checkNotNull(
                  loginState, r'AppState', 'loginState'),
              appLanguage: BuiltValueNullFieldError.checkNotNull(
                  appLanguage, r'AppState', 'appLanguage'),
              initialized: BuiltValueNullFieldError.checkNotNull(
                  initialized, r'AppState', 'initialized'),
              user: user.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
