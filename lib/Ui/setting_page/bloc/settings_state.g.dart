// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SettingsState extends SettingsState {
  @override
  final bool initialized;
  @override
  final String? error;
  @override
  final String appLanguage;
  @override
  final bool isLoading;
  @override
  final bool logout;
  @override
  final bool? viewCart;
  @override
  final bool notification;
  @override
  final bool success;
  @override
  final UserModel user;
  @override
  final BuiltList<Country> countries;
  @override
  final BuiltList<SkillModel> skills;
  @override
  final bool isLogin;

  factory _$SettingsState([void Function(SettingsStateBuilder)? updates]) =>
      (new SettingsStateBuilder()..update(updates))._build();

  _$SettingsState._(
      {required this.initialized,
      this.error,
      required this.appLanguage,
      required this.isLoading,
      required this.logout,
      this.viewCart,
      required this.notification,
      required this.success,
      required this.user,
      required this.countries,
      required this.skills,
      required this.isLogin})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'SettingsState', 'initialized');
    BuiltValueNullFieldError.checkNotNull(
        appLanguage, r'SettingsState', 'appLanguage');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'SettingsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(logout, r'SettingsState', 'logout');
    BuiltValueNullFieldError.checkNotNull(
        notification, r'SettingsState', 'notification');
    BuiltValueNullFieldError.checkNotNull(success, r'SettingsState', 'success');
    BuiltValueNullFieldError.checkNotNull(user, r'SettingsState', 'user');
    BuiltValueNullFieldError.checkNotNull(
        countries, r'SettingsState', 'countries');
    BuiltValueNullFieldError.checkNotNull(skills, r'SettingsState', 'skills');
    BuiltValueNullFieldError.checkNotNull(isLogin, r'SettingsState', 'isLogin');
  }

  @override
  SettingsState rebuild(void Function(SettingsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsStateBuilder toBuilder() => new SettingsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsState &&
        initialized == other.initialized &&
        error == other.error &&
        appLanguage == other.appLanguage &&
        isLoading == other.isLoading &&
        logout == other.logout &&
        viewCart == other.viewCart &&
        notification == other.notification &&
        success == other.success &&
        user == other.user &&
        countries == other.countries &&
        skills == other.skills &&
        isLogin == other.isLogin;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, appLanguage.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, logout.hashCode);
    _$hash = $jc(_$hash, viewCart.hashCode);
    _$hash = $jc(_$hash, notification.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, countries.hashCode);
    _$hash = $jc(_$hash, skills.hashCode);
    _$hash = $jc(_$hash, isLogin.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SettingsState')
          ..add('initialized', initialized)
          ..add('error', error)
          ..add('appLanguage', appLanguage)
          ..add('isLoading', isLoading)
          ..add('logout', logout)
          ..add('viewCart', viewCart)
          ..add('notification', notification)
          ..add('success', success)
          ..add('user', user)
          ..add('countries', countries)
          ..add('skills', skills)
          ..add('isLogin', isLogin))
        .toString();
  }
}

class SettingsStateBuilder
    implements Builder<SettingsState, SettingsStateBuilder> {
  _$SettingsState? _$v;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _appLanguage;
  String? get appLanguage => _$this._appLanguage;
  set appLanguage(String? appLanguage) => _$this._appLanguage = appLanguage;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _logout;
  bool? get logout => _$this._logout;
  set logout(bool? logout) => _$this._logout = logout;

  bool? _viewCart;
  bool? get viewCart => _$this._viewCart;
  set viewCart(bool? viewCart) => _$this._viewCart = viewCart;

  bool? _notification;
  bool? get notification => _$this._notification;
  set notification(bool? notification) => _$this._notification = notification;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  ListBuilder<Country>? _countries;
  ListBuilder<Country> get countries =>
      _$this._countries ??= new ListBuilder<Country>();
  set countries(ListBuilder<Country>? countries) =>
      _$this._countries = countries;

  ListBuilder<SkillModel>? _skills;
  ListBuilder<SkillModel> get skills =>
      _$this._skills ??= new ListBuilder<SkillModel>();
  set skills(ListBuilder<SkillModel>? skills) => _$this._skills = skills;

  bool? _isLogin;
  bool? get isLogin => _$this._isLogin;
  set isLogin(bool? isLogin) => _$this._isLogin = isLogin;

  SettingsStateBuilder();

  SettingsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _initialized = $v.initialized;
      _error = $v.error;
      _appLanguage = $v.appLanguage;
      _isLoading = $v.isLoading;
      _logout = $v.logout;
      _viewCart = $v.viewCart;
      _notification = $v.notification;
      _success = $v.success;
      _user = $v.user.toBuilder();
      _countries = $v.countries.toBuilder();
      _skills = $v.skills.toBuilder();
      _isLogin = $v.isLogin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SettingsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SettingsState;
  }

  @override
  void update(void Function(SettingsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SettingsState build() => _build();

  _$SettingsState _build() {
    _$SettingsState _$result;
    try {
      _$result = _$v ??
          new _$SettingsState._(
              initialized: BuiltValueNullFieldError.checkNotNull(
                  initialized, r'SettingsState', 'initialized'),
              error: error,
              appLanguage: BuiltValueNullFieldError.checkNotNull(
                  appLanguage, r'SettingsState', 'appLanguage'),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'SettingsState', 'isLoading'),
              logout: BuiltValueNullFieldError.checkNotNull(
                  logout, r'SettingsState', 'logout'),
              viewCart: viewCart,
              notification: BuiltValueNullFieldError.checkNotNull(
                  notification, r'SettingsState', 'notification'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'SettingsState', 'success'),
              user: user.build(),
              countries: countries.build(),
              skills: skills.build(),
              isLogin: BuiltValueNullFieldError.checkNotNull(
                  isLogin, r'SettingsState', 'isLogin'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'countries';
        countries.build();
        _$failedField = 'skills';
        skills.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SettingsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
