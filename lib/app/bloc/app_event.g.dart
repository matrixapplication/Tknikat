// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitEvent extends InitEvent {
  factory _$InitEvent([void Function(InitEventBuilder)? updates]) =>
      (new InitEventBuilder()..update(updates))._build();

  _$InitEvent._() : super._();

  @override
  InitEvent rebuild(void Function(InitEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitEventBuilder toBuilder() => new InitEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitEvent;
  }

  @override
  int get hashCode {
    return 631190438;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'InitEvent').toString();
  }
}

class InitEventBuilder implements Builder<InitEvent, InitEventBuilder> {
  _$InitEvent? _$v;

  InitEventBuilder();

  @override
  void replace(InitEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitEvent;
  }

  @override
  void update(void Function(InitEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitEvent build() => _build();

  _$InitEvent _build() {
    final _$result = _$v ?? new _$InitEvent._();
    replace(_$result);
    return _$result;
  }
}

class _$LogOutUser extends LogOutUser {
  factory _$LogOutUser([void Function(LogOutUserBuilder)? updates]) =>
      (new LogOutUserBuilder()..update(updates))._build();

  _$LogOutUser._() : super._();

  @override
  LogOutUser rebuild(void Function(LogOutUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogOutUserBuilder toBuilder() => new LogOutUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogOutUser;
  }

  @override
  int get hashCode {
    return 766153500;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'LogOutUser').toString();
  }
}

class LogOutUserBuilder implements Builder<LogOutUser, LogOutUserBuilder> {
  _$LogOutUser? _$v;

  LogOutUserBuilder();

  @override
  void replace(LogOutUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogOutUser;
  }

  @override
  void update(void Function(LogOutUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogOutUser build() => _build();

  _$LogOutUser _build() {
    final _$result = _$v ?? new _$LogOutUser._();
    replace(_$result);
    return _$result;
  }
}

class _$DeleteAccount extends DeleteAccount {
  factory _$DeleteAccount([void Function(DeleteAccountBuilder)? updates]) =>
      (new DeleteAccountBuilder()..update(updates))._build();

  _$DeleteAccount._() : super._();

  @override
  DeleteAccount rebuild(void Function(DeleteAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteAccountBuilder toBuilder() => new DeleteAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteAccount;
  }

  @override
  int get hashCode {
    return 707754017;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'DeleteAccount').toString();
  }
}

class DeleteAccountBuilder
    implements Builder<DeleteAccount, DeleteAccountBuilder> {
  _$DeleteAccount? _$v;

  DeleteAccountBuilder();

  @override
  void replace(DeleteAccount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteAccount;
  }

  @override
  void update(void Function(DeleteAccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteAccount build() => _build();

  _$DeleteAccount _build() {
    final _$result = _$v ?? new _$DeleteAccount._();
    replace(_$result);
    return _$result;
  }
}

class _$ChangeAppCurrency extends ChangeAppCurrency {
  @override
  final String appCurrency;

  factory _$ChangeAppCurrency(
          [void Function(ChangeAppCurrencyBuilder)? updates]) =>
      (new ChangeAppCurrencyBuilder()..update(updates))._build();

  _$ChangeAppCurrency._({required this.appCurrency}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        appCurrency, r'ChangeAppCurrency', 'appCurrency');
  }

  @override
  ChangeAppCurrency rebuild(void Function(ChangeAppCurrencyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeAppCurrencyBuilder toBuilder() =>
      new ChangeAppCurrencyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeAppCurrency && appCurrency == other.appCurrency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appCurrency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeAppCurrency')
          ..add('appCurrency', appCurrency))
        .toString();
  }
}

class ChangeAppCurrencyBuilder
    implements Builder<ChangeAppCurrency, ChangeAppCurrencyBuilder> {
  _$ChangeAppCurrency? _$v;

  String? _appCurrency;
  String? get appCurrency => _$this._appCurrency;
  set appCurrency(String? appCurrency) => _$this._appCurrency = appCurrency;

  ChangeAppCurrencyBuilder();

  ChangeAppCurrencyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appCurrency = $v.appCurrency;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeAppCurrency other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeAppCurrency;
  }

  @override
  void update(void Function(ChangeAppCurrencyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeAppCurrency build() => _build();

  _$ChangeAppCurrency _build() {
    final _$result = _$v ??
        new _$ChangeAppCurrency._(
            appCurrency: BuiltValueNullFieldError.checkNotNull(
                appCurrency, r'ChangeAppCurrency', 'appCurrency'));
    replace(_$result);
    return _$result;
  }
}

class _$ChangeAppLanguage extends ChangeAppLanguage {
  @override
  final String appLanguage;

  factory _$ChangeAppLanguage(
          [void Function(ChangeAppLanguageBuilder)? updates]) =>
      (new ChangeAppLanguageBuilder()..update(updates))._build();

  _$ChangeAppLanguage._({required this.appLanguage}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        appLanguage, r'ChangeAppLanguage', 'appLanguage');
  }

  @override
  ChangeAppLanguage rebuild(void Function(ChangeAppLanguageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeAppLanguageBuilder toBuilder() =>
      new ChangeAppLanguageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeAppLanguage && appLanguage == other.appLanguage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appLanguage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangeAppLanguage')
          ..add('appLanguage', appLanguage))
        .toString();
  }
}

class ChangeAppLanguageBuilder
    implements Builder<ChangeAppLanguage, ChangeAppLanguageBuilder> {
  _$ChangeAppLanguage? _$v;

  String? _appLanguage;
  String? get appLanguage => _$this._appLanguage;
  set appLanguage(String? appLanguage) => _$this._appLanguage = appLanguage;

  ChangeAppLanguageBuilder();

  ChangeAppLanguageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appLanguage = $v.appLanguage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangeAppLanguage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeAppLanguage;
  }

  @override
  void update(void Function(ChangeAppLanguageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeAppLanguage build() => _build();

  _$ChangeAppLanguage _build() {
    final _$result = _$v ??
        new _$ChangeAppLanguage._(
            appLanguage: BuiltValueNullFieldError.checkNotNull(
                appLanguage, r'ChangeAppLanguage', 'appLanguage'));
    replace(_$result);
    return _$result;
  }
}

class _$GetAppLanguage extends GetAppLanguage {
  factory _$GetAppLanguage([void Function(GetAppLanguageBuilder)? updates]) =>
      (new GetAppLanguageBuilder()..update(updates))._build();

  _$GetAppLanguage._() : super._();

  @override
  GetAppLanguage rebuild(void Function(GetAppLanguageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAppLanguageBuilder toBuilder() =>
      new GetAppLanguageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAppLanguage;
  }

  @override
  int get hashCode {
    return 42217207;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetAppLanguage').toString();
  }
}

class GetAppLanguageBuilder
    implements Builder<GetAppLanguage, GetAppLanguageBuilder> {
  _$GetAppLanguage? _$v;

  GetAppLanguageBuilder();

  @override
  void replace(GetAppLanguage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAppLanguage;
  }

  @override
  void update(void Function(GetAppLanguageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAppLanguage build() => _build();

  _$GetAppLanguage _build() {
    final _$result = _$v ?? new _$GetAppLanguage._();
    replace(_$result);
    return _$result;
  }
}

class _$GetCurrencyApp extends GetCurrencyApp {
  factory _$GetCurrencyApp([void Function(GetCurrencyAppBuilder)? updates]) =>
      (new GetCurrencyAppBuilder()..update(updates))._build();

  _$GetCurrencyApp._() : super._();

  @override
  GetCurrencyApp rebuild(void Function(GetCurrencyAppBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCurrencyAppBuilder toBuilder() =>
      new GetCurrencyAppBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCurrencyApp;
  }

  @override
  int get hashCode {
    return 718127302;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetCurrencyApp').toString();
  }
}

class GetCurrencyAppBuilder
    implements Builder<GetCurrencyApp, GetCurrencyAppBuilder> {
  _$GetCurrencyApp? _$v;

  GetCurrencyAppBuilder();

  @override
  void replace(GetCurrencyApp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetCurrencyApp;
  }

  @override
  void update(void Function(GetCurrencyAppBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCurrencyApp build() => _build();

  _$GetCurrencyApp _build() {
    final _$result = _$v ?? new _$GetCurrencyApp._();
    replace(_$result);
    return _$result;
  }
}

class _$UpdateToken extends UpdateToken {
  @override
  final String firebase_token;

  factory _$UpdateToken([void Function(UpdateTokenBuilder)? updates]) =>
      (new UpdateTokenBuilder()..update(updates))._build();

  _$UpdateToken._({required this.firebase_token}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firebase_token, r'UpdateToken', 'firebase_token');
  }

  @override
  UpdateToken rebuild(void Function(UpdateTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateTokenBuilder toBuilder() => new UpdateTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateToken && firebase_token == other.firebase_token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, firebase_token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateToken')
          ..add('firebase_token', firebase_token))
        .toString();
  }
}

class UpdateTokenBuilder implements Builder<UpdateToken, UpdateTokenBuilder> {
  _$UpdateToken? _$v;

  String? _firebase_token;
  String? get firebase_token => _$this._firebase_token;
  set firebase_token(String? firebase_token) =>
      _$this._firebase_token = firebase_token;

  UpdateTokenBuilder();

  UpdateTokenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firebase_token = $v.firebase_token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateToken other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateToken;
  }

  @override
  void update(void Function(UpdateTokenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateToken build() => _build();

  _$UpdateToken _build() {
    final _$result = _$v ??
        new _$UpdateToken._(
            firebase_token: BuiltValueNullFieldError.checkNotNull(
                firebase_token, r'UpdateToken', 'firebase_token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
