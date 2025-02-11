// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TryLogin extends TryLogin {
  @override
  final String mobile;
  @override
  final String password;

  factory _$TryLogin([void Function(TryLoginBuilder)? updates]) =>
      (new TryLoginBuilder()..update(updates))._build();

  _$TryLogin._({required this.mobile, required this.password}) : super._() {
    BuiltValueNullFieldError.checkNotNull(mobile, r'TryLogin', 'mobile');
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
        mobile == other.mobile &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, mobile.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TryLogin')
          ..add('mobile', mobile)
          ..add('password', password))
        .toString();
  }
}

class TryLoginBuilder implements Builder<TryLogin, TryLoginBuilder> {
  _$TryLogin? _$v;

  String? _mobile;
  String? get mobile => _$this._mobile;
  set mobile(String? mobile) => _$this._mobile = mobile;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  TryLoginBuilder();

  TryLoginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mobile = $v.mobile;
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
            mobile: BuiltValueNullFieldError.checkNotNull(
                mobile, r'TryLogin', 'mobile'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'TryLogin', 'password'));
    replace(_$result);
    return _$result;
  }
}

class _$ClearState extends ClearState {
  factory _$ClearState([void Function(ClearStateBuilder)? updates]) =>
      (new ClearStateBuilder()..update(updates))._build();

  _$ClearState._() : super._();

  @override
  ClearState rebuild(void Function(ClearStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearStateBuilder toBuilder() => new ClearStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearState;
  }

  @override
  int get hashCode {
    return 338996177;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearState').toString();
  }
}

class ClearStateBuilder implements Builder<ClearState, ClearStateBuilder> {
  _$ClearState? _$v;

  ClearStateBuilder();

  @override
  void replace(ClearState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearState;
  }

  @override
  void update(void Function(ClearStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearState build() => _build();

  _$ClearState _build() {
    final _$result = _$v ?? new _$ClearState._();
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

class _$GetProfile extends GetProfile {
  factory _$GetProfile([void Function(GetProfileBuilder)? updates]) =>
      (new GetProfileBuilder()..update(updates))._build();

  _$GetProfile._() : super._();

  @override
  GetProfile rebuild(void Function(GetProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetProfileBuilder toBuilder() => new GetProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetProfile;
  }

  @override
  int get hashCode {
    return 520564276;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetProfile').toString();
  }
}

class GetProfileBuilder implements Builder<GetProfile, GetProfileBuilder> {
  _$GetProfile? _$v;

  GetProfileBuilder();

  @override
  void replace(GetProfile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetProfile;
  }

  @override
  void update(void Function(GetProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetProfile build() => _build();

  _$GetProfile _build() {
    final _$result = _$v ?? new _$GetProfile._();
    replace(_$result);
    return _$result;
  }
}

class _$ChangePersonalStatus extends ChangePersonalStatus {
  @override
  final String keyValue;
  @override
  final String statusValue;

  factory _$ChangePersonalStatus(
          [void Function(ChangePersonalStatusBuilder)? updates]) =>
      (new ChangePersonalStatusBuilder()..update(updates))._build();

  _$ChangePersonalStatus._({required this.keyValue, required this.statusValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        keyValue, r'ChangePersonalStatus', 'keyValue');
    BuiltValueNullFieldError.checkNotNull(
        statusValue, r'ChangePersonalStatus', 'statusValue');
  }

  @override
  ChangePersonalStatus rebuild(
          void Function(ChangePersonalStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangePersonalStatusBuilder toBuilder() =>
      new ChangePersonalStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangePersonalStatus &&
        keyValue == other.keyValue &&
        statusValue == other.statusValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, keyValue.hashCode);
    _$hash = $jc(_$hash, statusValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChangePersonalStatus')
          ..add('keyValue', keyValue)
          ..add('statusValue', statusValue))
        .toString();
  }
}

class ChangePersonalStatusBuilder
    implements Builder<ChangePersonalStatus, ChangePersonalStatusBuilder> {
  _$ChangePersonalStatus? _$v;

  String? _keyValue;
  String? get keyValue => _$this._keyValue;
  set keyValue(String? keyValue) => _$this._keyValue = keyValue;

  String? _statusValue;
  String? get statusValue => _$this._statusValue;
  set statusValue(String? statusValue) => _$this._statusValue = statusValue;

  ChangePersonalStatusBuilder();

  ChangePersonalStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _keyValue = $v.keyValue;
      _statusValue = $v.statusValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChangePersonalStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangePersonalStatus;
  }

  @override
  void update(void Function(ChangePersonalStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangePersonalStatus build() => _build();

  _$ChangePersonalStatus _build() {
    final _$result = _$v ??
        new _$ChangePersonalStatus._(
            keyValue: BuiltValueNullFieldError.checkNotNull(
                keyValue, r'ChangePersonalStatus', 'keyValue'),
            statusValue: BuiltValueNullFieldError.checkNotNull(
                statusValue, r'ChangePersonalStatus', 'statusValue'));
    replace(_$result);
    return _$result;
  }
}

class _$ForgotPassword extends ForgotPassword {
  @override
  final String email;

  factory _$ForgotPassword([void Function(ForgotPasswordBuilder)? updates]) =>
      (new ForgotPasswordBuilder()..update(updates))._build();

  _$ForgotPassword._({required this.email}) : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'ForgotPassword', 'email');
  }

  @override
  ForgotPassword rebuild(void Function(ForgotPasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForgotPasswordBuilder toBuilder() =>
      new ForgotPasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForgotPassword && email == other.email;
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
    return (newBuiltValueToStringHelper(r'ForgotPassword')..add('email', email))
        .toString();
  }
}

class ForgotPasswordBuilder
    implements Builder<ForgotPassword, ForgotPasswordBuilder> {
  _$ForgotPassword? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  ForgotPasswordBuilder();

  ForgotPasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForgotPassword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ForgotPassword;
  }

  @override
  void update(void Function(ForgotPasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ForgotPassword build() => _build();

  _$ForgotPassword _build() {
    final _$result = _$v ??
        new _$ForgotPassword._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'ForgotPassword', 'email'));
    replace(_$result);
    return _$result;
  }
}

class _$FindPassword extends FindPassword {
  @override
  final String email;

  factory _$FindPassword([void Function(FindPasswordBuilder)? updates]) =>
      (new FindPasswordBuilder()..update(updates))._build();

  _$FindPassword._({required this.email}) : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'FindPassword', 'email');
  }

  @override
  FindPassword rebuild(void Function(FindPasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FindPasswordBuilder toBuilder() => new FindPasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FindPassword && email == other.email;
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
    return (newBuiltValueToStringHelper(r'FindPassword')..add('email', email))
        .toString();
  }
}

class FindPasswordBuilder
    implements Builder<FindPassword, FindPasswordBuilder> {
  _$FindPassword? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  FindPasswordBuilder();

  FindPasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FindPassword other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FindPassword;
  }

  @override
  void update(void Function(FindPasswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FindPassword build() => _build();

  _$FindPassword _build() {
    final _$result = _$v ??
        new _$FindPassword._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'FindPassword', 'email'));
    replace(_$result);
    return _$result;
  }
}

class _$ResetPassword extends ResetPassword {
  @override
  final String old_password;
  @override
  final String password;
  @override
  final String password_confirmation;

  factory _$ResetPassword([void Function(ResetPasswordBuilder)? updates]) =>
      (new ResetPasswordBuilder()..update(updates))._build();

  _$ResetPassword._(
      {required this.old_password,
      required this.password,
      required this.password_confirmation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        old_password, r'ResetPassword', 'old_password');
    BuiltValueNullFieldError.checkNotNull(
        password, r'ResetPassword', 'password');
    BuiltValueNullFieldError.checkNotNull(
        password_confirmation, r'ResetPassword', 'password_confirmation');
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
        old_password == other.old_password &&
        password == other.password &&
        password_confirmation == other.password_confirmation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, old_password.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, password_confirmation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResetPassword')
          ..add('old_password', old_password)
          ..add('password', password)
          ..add('password_confirmation', password_confirmation))
        .toString();
  }
}

class ResetPasswordBuilder
    implements Builder<ResetPassword, ResetPasswordBuilder> {
  _$ResetPassword? _$v;

  String? _old_password;
  String? get old_password => _$this._old_password;
  set old_password(String? old_password) => _$this._old_password = old_password;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  String? _password_confirmation;
  String? get password_confirmation => _$this._password_confirmation;
  set password_confirmation(String? password_confirmation) =>
      _$this._password_confirmation = password_confirmation;

  ResetPasswordBuilder();

  ResetPasswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _old_password = $v.old_password;
      _password = $v.password;
      _password_confirmation = $v.password_confirmation;
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
            old_password: BuiltValueNullFieldError.checkNotNull(
                old_password, r'ResetPassword', 'old_password'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'ResetPassword', 'password'),
            password_confirmation: BuiltValueNullFieldError.checkNotNull(
                password_confirmation,
                r'ResetPassword',
                'password_confirmation'));
    replace(_$result);
    return _$result;
  }
}

class _$TryEdit extends TryEdit {
  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final String email;
  @override
  final String? facebook;
  @override
  final String? youtube;
  @override
  final String? instagram;
  @override
  final String? linkedin;
  @override
  final String? twitter;
  @override
  final String? snapchat;
  @override
  final String phone;
  @override
  final File? image;
  @override
  final String summary;
  @override
  final String gender;
  @override
  final int countryId;
  @override
  final int cityId;
  @override
  final List<SkillModel> skills;

  factory _$TryEdit([void Function(TryEditBuilder)? updates]) =>
      (new TryEditBuilder()..update(updates))._build();

  _$TryEdit._(
      {required this.first_name,
      required this.last_name,
      required this.email,
      this.facebook,
      this.youtube,
      this.instagram,
      this.linkedin,
      this.twitter,
      this.snapchat,
      required this.phone,
      this.image,
      required this.summary,
      required this.gender,
      required this.countryId,
      required this.cityId,
      required this.skills})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(first_name, r'TryEdit', 'first_name');
    BuiltValueNullFieldError.checkNotNull(last_name, r'TryEdit', 'last_name');
    BuiltValueNullFieldError.checkNotNull(email, r'TryEdit', 'email');
    BuiltValueNullFieldError.checkNotNull(phone, r'TryEdit', 'phone');
    BuiltValueNullFieldError.checkNotNull(summary, r'TryEdit', 'summary');
    BuiltValueNullFieldError.checkNotNull(gender, r'TryEdit', 'gender');
    BuiltValueNullFieldError.checkNotNull(countryId, r'TryEdit', 'countryId');
    BuiltValueNullFieldError.checkNotNull(cityId, r'TryEdit', 'cityId');
    BuiltValueNullFieldError.checkNotNull(skills, r'TryEdit', 'skills');
  }

  @override
  TryEdit rebuild(void Function(TryEditBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TryEditBuilder toBuilder() => new TryEditBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TryEdit &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        email == other.email &&
        facebook == other.facebook &&
        youtube == other.youtube &&
        instagram == other.instagram &&
        linkedin == other.linkedin &&
        twitter == other.twitter &&
        snapchat == other.snapchat &&
        phone == other.phone &&
        image == other.image &&
        summary == other.summary &&
        gender == other.gender &&
        countryId == other.countryId &&
        cityId == other.cityId &&
        skills == other.skills;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, first_name.hashCode);
    _$hash = $jc(_$hash, last_name.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, facebook.hashCode);
    _$hash = $jc(_$hash, youtube.hashCode);
    _$hash = $jc(_$hash, instagram.hashCode);
    _$hash = $jc(_$hash, linkedin.hashCode);
    _$hash = $jc(_$hash, twitter.hashCode);
    _$hash = $jc(_$hash, snapchat.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, countryId.hashCode);
    _$hash = $jc(_$hash, cityId.hashCode);
    _$hash = $jc(_$hash, skills.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TryEdit')
          ..add('first_name', first_name)
          ..add('last_name', last_name)
          ..add('email', email)
          ..add('facebook', facebook)
          ..add('youtube', youtube)
          ..add('instagram', instagram)
          ..add('linkedin', linkedin)
          ..add('twitter', twitter)
          ..add('snapchat', snapchat)
          ..add('phone', phone)
          ..add('image', image)
          ..add('summary', summary)
          ..add('gender', gender)
          ..add('countryId', countryId)
          ..add('cityId', cityId)
          ..add('skills', skills))
        .toString();
  }
}

class TryEditBuilder implements Builder<TryEdit, TryEditBuilder> {
  _$TryEdit? _$v;

  String? _first_name;
  String? get first_name => _$this._first_name;
  set first_name(String? first_name) => _$this._first_name = first_name;

  String? _last_name;
  String? get last_name => _$this._last_name;
  set last_name(String? last_name) => _$this._last_name = last_name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _facebook;
  String? get facebook => _$this._facebook;
  set facebook(String? facebook) => _$this._facebook = facebook;

  String? _youtube;
  String? get youtube => _$this._youtube;
  set youtube(String? youtube) => _$this._youtube = youtube;

  String? _instagram;
  String? get instagram => _$this._instagram;
  set instagram(String? instagram) => _$this._instagram = instagram;

  String? _linkedin;
  String? get linkedin => _$this._linkedin;
  set linkedin(String? linkedin) => _$this._linkedin = linkedin;

  String? _twitter;
  String? get twitter => _$this._twitter;
  set twitter(String? twitter) => _$this._twitter = twitter;

  String? _snapchat;
  String? get snapchat => _$this._snapchat;
  set snapchat(String? snapchat) => _$this._snapchat = snapchat;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  File? _image;
  File? get image => _$this._image;
  set image(File? image) => _$this._image = image;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  int? _countryId;
  int? get countryId => _$this._countryId;
  set countryId(int? countryId) => _$this._countryId = countryId;

  int? _cityId;
  int? get cityId => _$this._cityId;
  set cityId(int? cityId) => _$this._cityId = cityId;

  List<SkillModel>? _skills;
  List<SkillModel>? get skills => _$this._skills;
  set skills(List<SkillModel>? skills) => _$this._skills = skills;

  TryEditBuilder();

  TryEditBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first_name = $v.first_name;
      _last_name = $v.last_name;
      _email = $v.email;
      _facebook = $v.facebook;
      _youtube = $v.youtube;
      _instagram = $v.instagram;
      _linkedin = $v.linkedin;
      _twitter = $v.twitter;
      _snapchat = $v.snapchat;
      _phone = $v.phone;
      _image = $v.image;
      _summary = $v.summary;
      _gender = $v.gender;
      _countryId = $v.countryId;
      _cityId = $v.cityId;
      _skills = $v.skills;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TryEdit other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TryEdit;
  }

  @override
  void update(void Function(TryEditBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TryEdit build() => _build();

  _$TryEdit _build() {
    final _$result = _$v ??
        new _$TryEdit._(
            first_name: BuiltValueNullFieldError.checkNotNull(
                first_name, r'TryEdit', 'first_name'),
            last_name: BuiltValueNullFieldError.checkNotNull(
                last_name, r'TryEdit', 'last_name'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'TryEdit', 'email'),
            facebook: facebook,
            youtube: youtube,
            instagram: instagram,
            linkedin: linkedin,
            twitter: twitter,
            snapchat: snapchat,
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'TryEdit', 'phone'),
            image: image,
            summary: BuiltValueNullFieldError.checkNotNull(
                summary, r'TryEdit', 'summary'),
            gender: BuiltValueNullFieldError.checkNotNull(
                gender, r'TryEdit', 'gender'),
            countryId: BuiltValueNullFieldError.checkNotNull(
                countryId, r'TryEdit', 'countryId'),
            cityId: BuiltValueNullFieldError.checkNotNull(
                cityId, r'TryEdit', 'cityId'),
            skills: BuiltValueNullFieldError.checkNotNull(
                skills, r'TryEdit', 'skills'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
