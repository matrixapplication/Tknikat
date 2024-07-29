// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TryLogin extends TryLogin {
  @override
  final String phone;
  @override
  final String password;

  factory _$TryLogin([void Function(TryLoginBuilder)? updates]) =>
      (new TryLoginBuilder()..update(updates))._build();

  _$TryLogin._({required this.phone, required this.password}) : super._() {
    BuiltValueNullFieldError.checkNotNull(phone, r'TryLogin', 'phone');
    BuiltValueNullFieldError.checkNotNull(password, r'TryLogin', 'password');
  }

  @override
  TryLogin rebuild(void Function(TryLoginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TryLoginBuilder toBuilder() => new TryLoginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TryLogin &&
        phone == other.phone &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TryLogin')
          ..add('phone', phone)
          ..add('password', password))
        .toString();
  }
}

class TryLoginBuilder implements Builder<TryLogin, TryLoginBuilder> {
  _$TryLogin? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  TryLoginBuilder();

  TryLoginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TryLogin other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TryLogin;
  }

  @override
  void update(void Function(TryLoginBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TryLogin build() => _build();

  _$TryLogin _build() {
    final _$result = _$v ??
        new _$TryLogin._(
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'TryLogin', 'phone'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'TryLogin', 'password'));
    replace(_$result);
    return _$result;
  }
}

class _$TryLoginWithGoogle extends TryLoginWithGoogle {
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String uId;

  factory _$TryLoginWithGoogle(
          [void Function(TryLoginWithGoogleBuilder)? updates]) =>
      (new TryLoginWithGoogleBuilder()..update(updates))._build();

  _$TryLoginWithGoogle._(
      {required this.name,
      required this.email,
      required this.phone,
      required this.uId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'TryLoginWithGoogle', 'name');
    BuiltValueNullFieldError.checkNotNull(
        email, r'TryLoginWithGoogle', 'email');
    BuiltValueNullFieldError.checkNotNull(
        phone, r'TryLoginWithGoogle', 'phone');
    BuiltValueNullFieldError.checkNotNull(uId, r'TryLoginWithGoogle', 'uId');
  }

  @override
  TryLoginWithGoogle rebuild(
          void Function(TryLoginWithGoogleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TryLoginWithGoogleBuilder toBuilder() =>
      new TryLoginWithGoogleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TryLoginWithGoogle &&
        name == other.name &&
        email == other.email &&
        phone == other.phone &&
        uId == other.uId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, uId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TryLoginWithGoogle')
          ..add('name', name)
          ..add('email', email)
          ..add('phone', phone)
          ..add('uId', uId))
        .toString();
  }
}

class TryLoginWithGoogleBuilder
    implements Builder<TryLoginWithGoogle, TryLoginWithGoogleBuilder> {
  _$TryLoginWithGoogle? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _uId;
  String? get uId => _$this._uId;
  set uId(String? uId) => _$this._uId = uId;

  TryLoginWithGoogleBuilder();

  TryLoginWithGoogleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _email = $v.email;
      _phone = $v.phone;
      _uId = $v.uId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TryLoginWithGoogle other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TryLoginWithGoogle;
  }

  @override
  void update(void Function(TryLoginWithGoogleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TryLoginWithGoogle build() => _build();

  _$TryLoginWithGoogle _build() {
    final _$result = _$v ??
        new _$TryLoginWithGoogle._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'TryLoginWithGoogle', 'name'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'TryLoginWithGoogle', 'email'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'TryLoginWithGoogle', 'phone'),
            uId: BuiltValueNullFieldError.checkNotNull(
                uId, r'TryLoginWithGoogle', 'uId'));
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

class _$ActivateAccount extends ActivateAccount {
  @override
  final String email;
  @override
  final String activation_code;

  factory _$ActivateAccount([void Function(ActivateAccountBuilder)? updates]) =>
      (new ActivateAccountBuilder()..update(updates))._build();

  _$ActivateAccount._({required this.email, required this.activation_code})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'ActivateAccount', 'email');
    BuiltValueNullFieldError.checkNotNull(
        activation_code, r'ActivateAccount', 'activation_code');
  }

  @override
  ActivateAccount rebuild(void Function(ActivateAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivateAccountBuilder toBuilder() =>
      new ActivateAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivateAccount &&
        email == other.email &&
        activation_code == other.activation_code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, activation_code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActivateAccount')
          ..add('email', email)
          ..add('activation_code', activation_code))
        .toString();
  }
}

class ActivateAccountBuilder
    implements Builder<ActivateAccount, ActivateAccountBuilder> {
  _$ActivateAccount? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _activation_code;
  String? get activation_code => _$this._activation_code;
  set activation_code(String? activation_code) =>
      _$this._activation_code = activation_code;

  ActivateAccountBuilder();

  ActivateAccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _activation_code = $v.activation_code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivateAccount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActivateAccount;
  }

  @override
  void update(void Function(ActivateAccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActivateAccount build() => _build();

  _$ActivateAccount _build() {
    final _$result = _$v ??
        new _$ActivateAccount._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'ActivateAccount', 'email'),
            activation_code: BuiltValueNullFieldError.checkNotNull(
                activation_code, r'ActivateAccount', 'activation_code'));
    replace(_$result);
    return _$result;
  }
}

class _$VerfyCode extends VerfyCode {
  @override
  final String email;
  @override
  final String activation_code;

  factory _$VerfyCode([void Function(VerfyCodeBuilder)? updates]) =>
      (new VerfyCodeBuilder()..update(updates))._build();

  _$VerfyCode._({required this.email, required this.activation_code})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'VerfyCode', 'email');
    BuiltValueNullFieldError.checkNotNull(
        activation_code, r'VerfyCode', 'activation_code');
  }

  @override
  VerfyCode rebuild(void Function(VerfyCodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerfyCodeBuilder toBuilder() => new VerfyCodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerfyCode &&
        email == other.email &&
        activation_code == other.activation_code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, activation_code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerfyCode')
          ..add('email', email)
          ..add('activation_code', activation_code))
        .toString();
  }
}

class VerfyCodeBuilder implements Builder<VerfyCode, VerfyCodeBuilder> {
  _$VerfyCode? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _activation_code;
  String? get activation_code => _$this._activation_code;
  set activation_code(String? activation_code) =>
      _$this._activation_code = activation_code;

  VerfyCodeBuilder();

  VerfyCodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _activation_code = $v.activation_code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerfyCode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerfyCode;
  }

  @override
  void update(void Function(VerfyCodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerfyCode build() => _build();

  _$VerfyCode _build() {
    final _$result = _$v ??
        new _$VerfyCode._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'VerfyCode', 'email'),
            activation_code: BuiltValueNullFieldError.checkNotNull(
                activation_code, r'VerfyCode', 'activation_code'));
    replace(_$result);
    return _$result;
  }
}

class _$SignUp extends SignUp {
  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final String phoneNumber;
  @override
  final String password;

  factory _$SignUp([void Function(SignUpBuilder)? updates]) =>
      (new SignUpBuilder()..update(updates))._build();

  _$SignUp._(
      {required this.first_name,
      required this.last_name,
      required this.phoneNumber,
      required this.password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(first_name, r'SignUp', 'first_name');
    BuiltValueNullFieldError.checkNotNull(last_name, r'SignUp', 'last_name');
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'SignUp', 'phoneNumber');
    BuiltValueNullFieldError.checkNotNull(password, r'SignUp', 'password');
  }

  @override
  SignUp rebuild(void Function(SignUpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignUpBuilder toBuilder() => new SignUpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignUp &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        phoneNumber == other.phoneNumber &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, first_name.hashCode);
    _$hash = $jc(_$hash, last_name.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignUp')
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('phoneNumber', phoneNumber)
          ..add('password', password))
        .toString();
  }
}

class SignUpBuilder implements Builder<SignUp, SignUpBuilder> {
  _$SignUp? _$v;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  SignUpBuilder();

  SignUpBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _phoneNumber = $v.phoneNumber;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignUp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignUp;
  }

  @override
  void update(void Function(SignUpBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignUp build() => _build();

  _$SignUp _build() {
    final _$result = _$v ??
        new _$SignUp._(
            first_name: BuiltValueNullFieldError.checkNotNull(
                first_name, r'SignUp', 'first_name'),
            last_name: BuiltValueNullFieldError.checkNotNull(
                last_name, r'SignUp', 'last_name'),
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, r'SignUp', 'phoneNumber'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'SignUp', 'password'));
    replace(_$result);
    return _$result;
  }
}

class _$CompleteProfile extends CompleteProfile {
  @override
  final String? phoneNumber;
  @override
  final String? email;
  @override
  final String? gender;
  @override
  final File avatar;
  @override
  final int? country;
  @override
  final int? city;

  factory _$CompleteProfile([void Function(CompleteProfileBuilder)? updates]) =>
      (new CompleteProfileBuilder()..update(updates))._build();

  _$CompleteProfile._(
      {this.phoneNumber,
      this.email,
      this.gender,
      required this.avatar,
      this.country,
      this.city})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(avatar, r'CompleteProfile', 'avatar');
  }

  @override
  CompleteProfile rebuild(void Function(CompleteProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompleteProfileBuilder toBuilder() =>
      new CompleteProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompleteProfile &&
        phoneNumber == other.phoneNumber &&
        email == other.email &&
        gender == other.gender &&
        avatar == other.avatar &&
        country == other.country &&
        city == other.city;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompleteProfile')
          ..add('phoneNumber', phoneNumber)
          ..add('email', email)
          ..add('gender', gender)
          ..add('avatar', avatar)
          ..add('country', country)
          ..add('city', city))
        .toString();
  }
}

class CompleteProfileBuilder
    implements Builder<CompleteProfile, CompleteProfileBuilder> {
  _$CompleteProfile? _$v;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  File? _avatar;
  File? get avatar => _$this._avatar;
  set avatar(File? avatar) => _$this._avatar = avatar;

  int? _country;
  int? get country => _$this._country;
  set country(int? country) => _$this._country = country;

  int? _city;
  int? get city => _$this._city;
  set city(int? city) => _$this._city = city;

  CompleteProfileBuilder();

  CompleteProfileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNumber = $v.phoneNumber;
      _email = $v.email;
      _gender = $v.gender;
      _avatar = $v.avatar;
      _country = $v.country;
      _city = $v.city;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompleteProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompleteProfile;
  }

  @override
  void update(void Function(CompleteProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompleteProfile build() => _build();

  _$CompleteProfile _build() {
    final _$result = _$v ??
        new _$CompleteProfile._(
            phoneNumber: phoneNumber,
            email: email,
            gender: gender,
            avatar: BuiltValueNullFieldError.checkNotNull(
                avatar, r'CompleteProfile', 'avatar'),
            country: country,
            city: city);
    replace(_$result);
    return _$result;
  }
}

class _$ResetPassword extends ResetPassword {
  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;

  factory _$ResetPassword([void Function(ResetPasswordBuilder)? updates]) =>
      (new ResetPasswordBuilder()..update(updates))._build();

  _$ResetPassword._(
      {required this.email,
      required this.password,
      required this.confirmPassword})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'ResetPassword', 'email');
    BuiltValueNullFieldError.checkNotNull(
        password, r'ResetPassword', 'password');
    BuiltValueNullFieldError.checkNotNull(
        confirmPassword, r'ResetPassword', 'confirmPassword');
  }

  @override
  ResetPassword rebuild(void Function(ResetPasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResetPasswordBuilder toBuilder() => new ResetPasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResetPassword &&
        email == other.email &&
        password == other.password &&
        confirmPassword == other.confirmPassword;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, confirmPassword.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResetPassword')
          ..add('email', email)
          ..add('password', password)
          ..add('confirmPassword', confirmPassword))
        .toString();
  }
}

class ResetPasswordBuilder
    implements Builder<ResetPassword, ResetPasswordBuilder> {
  _$ResetPassword? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _confirmPassword;
  String? get confirmPassword => _$this._confirmPassword;
  set confirmPassword(String? confirmPassword) =>
      _$this._confirmPassword = confirmPassword;

  ResetPasswordBuilder();

  ResetPasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _confirmPassword = $v.confirmPassword;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResetPassword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResetPassword;
  }

  @override
  void update(void Function(ResetPasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResetPassword build() => _build();

  _$ResetPassword _build() {
    final _$result = _$v ??
        new _$ResetPassword._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'ResetPassword', 'email'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'ResetPassword', 'password'),
            confirmPassword: BuiltValueNullFieldError.checkNotNull(
                confirmPassword, r'ResetPassword', 'confirmPassword'));
    replace(_$result);
    return _$result;
  }
}

class _$ResendCode extends ResendCode {
  @override
  final String email;

  factory _$ResendCode([void Function(ResendCodeBuilder)? updates]) =>
      (new ResendCodeBuilder()..update(updates))._build();

  _$ResendCode._({required this.email}) : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'ResendCode', 'email');
  }

  @override
  ResendCode rebuild(void Function(ResendCodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResendCodeBuilder toBuilder() => new ResendCodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResendCode && email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResendCode')..add('email', email))
        .toString();
  }
}

class ResendCodeBuilder implements Builder<ResendCode, ResendCodeBuilder> {
  _$ResendCode? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  ResendCodeBuilder();

  ResendCodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResendCode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResendCode;
  }

  @override
  void update(void Function(ResendCodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResendCode build() => _build();

  _$ResendCode _build() {
    final _$result = _$v ??
        new _$ResendCode._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'ResendCode', 'email'));
    replace(_$result);
    return _$result;
  }
}

class _$TryForgetPassword extends TryForgetPassword {
  @override
  final String email;

  factory _$TryForgetPassword(
          [void Function(TryForgetPasswordBuilder)? updates]) =>
      (new TryForgetPasswordBuilder()..update(updates))._build();

  _$TryForgetPassword._({required this.email}) : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'TryForgetPassword', 'email');
  }

  @override
  TryForgetPassword rebuild(void Function(TryForgetPasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TryForgetPasswordBuilder toBuilder() =>
      new TryForgetPasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TryForgetPassword && email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TryForgetPassword')
          ..add('email', email))
        .toString();
  }
}

class TryForgetPasswordBuilder
    implements Builder<TryForgetPassword, TryForgetPasswordBuilder> {
  _$TryForgetPassword? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  TryForgetPasswordBuilder();

  TryForgetPasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TryForgetPassword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TryForgetPassword;
  }

  @override
  void update(void Function(TryForgetPasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TryForgetPassword build() => _build();

  _$TryForgetPassword _build() {
    final _$result = _$v ??
        new _$TryForgetPassword._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'TryForgetPassword', 'email'));
    replace(_$result);
    return _$result;
  }
}

class _$TryForgetPasswordConfirm extends TryForgetPasswordConfirm {
  @override
  final String email;
  @override
  final String password;
  @override
  final String token;

  factory _$TryForgetPasswordConfirm(
          [void Function(TryForgetPasswordConfirmBuilder)? updates]) =>
      (new TryForgetPasswordConfirmBuilder()..update(updates))._build();

  _$TryForgetPasswordConfirm._(
      {required this.email, required this.password, required this.token})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        email, r'TryForgetPasswordConfirm', 'email');
    BuiltValueNullFieldError.checkNotNull(
        password, r'TryForgetPasswordConfirm', 'password');
    BuiltValueNullFieldError.checkNotNull(
        token, r'TryForgetPasswordConfirm', 'token');
  }

  @override
  TryForgetPasswordConfirm rebuild(
          void Function(TryForgetPasswordConfirmBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TryForgetPasswordConfirmBuilder toBuilder() =>
      new TryForgetPasswordConfirmBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TryForgetPasswordConfirm &&
        email == other.email &&
        password == other.password &&
        token == other.token;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TryForgetPasswordConfirm')
          ..add('email', email)
          ..add('password', password)
          ..add('token', token))
        .toString();
  }
}

class TryForgetPasswordConfirmBuilder
    implements
        Builder<TryForgetPasswordConfirm, TryForgetPasswordConfirmBuilder> {
  _$TryForgetPasswordConfirm? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  TryForgetPasswordConfirmBuilder();

  TryForgetPasswordConfirmBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TryForgetPasswordConfirm other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TryForgetPasswordConfirm;
  }

  @override
  void update(void Function(TryForgetPasswordConfirmBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TryForgetPasswordConfirm build() => _build();

  _$TryForgetPasswordConfirm _build() {
    final _$result = _$v ??
        new _$TryForgetPasswordConfirm._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'TryForgetPasswordConfirm', 'email'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'TryForgetPasswordConfirm', 'password'),
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'TryForgetPasswordConfirm', 'token'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
