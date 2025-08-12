// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserModel extends UserModel {
  @override
  final int? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? address;
  @override
  final String? birthDate;
  @override
  final String? avatar;
  @override
  final String? gender;
  @override
  final int? cityId;
  @override
  final City? city;
  @override
  final int? isCompleted;
  @override
  final int? countryId;
  @override
  final Country? country;
  @override
  final String? summary;
  @override
  final int? isPhoneShow;
  @override
  final int? isEmailShow;
  @override
  final int? isFaceBookShow;
  @override
  final int? isLinkedInShow;
  @override
  final int? isInstagramShow;
  @override
  final int? isSnapchatShow;
  @override
  final int? isTwitterShow;
  @override
  final int? isYoutubeShow;
  @override
  final int? isWhatsappShow;
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
  final String? whatsapp;
  @override
  final BuiltList<SkillModel>? skills;
  @override
  final String? firebaseToken;
  @override
  final String? createdAt;

  factory _$UserModel([void Function(UserModelBuilder)? updates]) =>
      (new UserModelBuilder()..update(updates))._build();

  _$UserModel._(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.address,
      this.birthDate,
      this.avatar,
      this.gender,
      this.cityId,
      this.city,
      this.isCompleted,
      this.countryId,
      this.country,
      this.summary,
      this.isPhoneShow,
      this.isEmailShow,
      this.isFaceBookShow,
      this.isLinkedInShow,
      this.isInstagramShow,
      this.isSnapchatShow,
      this.isTwitterShow,
      this.isYoutubeShow,
      this.isWhatsappShow,
      this.facebook,
      this.youtube,
      this.instagram,
      this.linkedin,
      this.twitter,
      this.snapchat,
      this.whatsapp,
      this.skills,
      this.firebaseToken,
      this.createdAt})
      : super._();

  @override
  UserModel rebuild(void Function(UserModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserModelBuilder toBuilder() => new UserModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        address == other.address &&
        birthDate == other.birthDate &&
        avatar == other.avatar &&
        gender == other.gender &&
        cityId == other.cityId &&
        city == other.city &&
        isCompleted == other.isCompleted &&
        countryId == other.countryId &&
        country == other.country &&
        summary == other.summary &&
        isPhoneShow == other.isPhoneShow &&
        isEmailShow == other.isEmailShow &&
        isFaceBookShow == other.isFaceBookShow &&
        isLinkedInShow == other.isLinkedInShow &&
        isInstagramShow == other.isInstagramShow &&
        isSnapchatShow == other.isSnapchatShow &&
        isTwitterShow == other.isTwitterShow &&
        isYoutubeShow == other.isYoutubeShow &&
        isWhatsappShow == other.isWhatsappShow &&
        facebook == other.facebook &&
        youtube == other.youtube &&
        instagram == other.instagram &&
        linkedin == other.linkedin &&
        twitter == other.twitter &&
        snapchat == other.snapchat &&
        whatsapp == other.whatsapp &&
        skills == other.skills &&
        firebaseToken == other.firebaseToken &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, birthDate.hashCode);
    _$hash = $jc(_$hash, avatar.hashCode);
    _$hash = $jc(_$hash, gender.hashCode);
    _$hash = $jc(_$hash, cityId.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, isCompleted.hashCode);
    _$hash = $jc(_$hash, countryId.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, isPhoneShow.hashCode);
    _$hash = $jc(_$hash, isEmailShow.hashCode);
    _$hash = $jc(_$hash, isFaceBookShow.hashCode);
    _$hash = $jc(_$hash, isLinkedInShow.hashCode);
    _$hash = $jc(_$hash, isInstagramShow.hashCode);
    _$hash = $jc(_$hash, isSnapchatShow.hashCode);
    _$hash = $jc(_$hash, isTwitterShow.hashCode);
    _$hash = $jc(_$hash, isYoutubeShow.hashCode);
    _$hash = $jc(_$hash, isWhatsappShow.hashCode);
    _$hash = $jc(_$hash, facebook.hashCode);
    _$hash = $jc(_$hash, youtube.hashCode);
    _$hash = $jc(_$hash, instagram.hashCode);
    _$hash = $jc(_$hash, linkedin.hashCode);
    _$hash = $jc(_$hash, twitter.hashCode);
    _$hash = $jc(_$hash, snapchat.hashCode);
    _$hash = $jc(_$hash, whatsapp.hashCode);
    _$hash = $jc(_$hash, skills.hashCode);
    _$hash = $jc(_$hash, firebaseToken.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserModel')
          ..add('id', id)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('phoneNumber', phoneNumber)
          ..add('address', address)
          ..add('birthDate', birthDate)
          ..add('avatar', avatar)
          ..add('gender', gender)
          ..add('cityId', cityId)
          ..add('city', city)
          ..add('isCompleted', isCompleted)
          ..add('countryId', countryId)
          ..add('country', country)
          ..add('summary', summary)
          ..add('isPhoneShow', isPhoneShow)
          ..add('isEmailShow', isEmailShow)
          ..add('isFaceBookShow', isFaceBookShow)
          ..add('isLinkedInShow', isLinkedInShow)
          ..add('isInstagramShow', isInstagramShow)
          ..add('isSnapchatShow', isSnapchatShow)
          ..add('isTwitterShow', isTwitterShow)
          ..add('isYoutubeShow', isYoutubeShow)
          ..add('isWhatsappShow', isWhatsappShow)
          ..add('facebook', facebook)
          ..add('youtube', youtube)
          ..add('instagram', instagram)
          ..add('linkedin', linkedin)
          ..add('twitter', twitter)
          ..add('snapchat', snapchat)
          ..add('whatsapp', whatsapp)
          ..add('skills', skills)
          ..add('firebaseToken', firebaseToken)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class UserModelBuilder implements Builder<UserModel, UserModelBuilder> {
  _$UserModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _birthDate;
  String? get birthDate => _$this._birthDate;
  set birthDate(String? birthDate) => _$this._birthDate = birthDate;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  int? _cityId;
  int? get cityId => _$this._cityId;
  set cityId(int? cityId) => _$this._cityId = cityId;

  CityBuilder? _city;
  CityBuilder get city => _$this._city ??= new CityBuilder();
  set city(CityBuilder? city) => _$this._city = city;

  int? _isCompleted;
  int? get isCompleted => _$this._isCompleted;
  set isCompleted(int? isCompleted) => _$this._isCompleted = isCompleted;

  int? _countryId;
  int? get countryId => _$this._countryId;
  set countryId(int? countryId) => _$this._countryId = countryId;

  CountryBuilder? _country;
  CountryBuilder get country => _$this._country ??= new CountryBuilder();
  set country(CountryBuilder? country) => _$this._country = country;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  int? _isPhoneShow;
  int? get isPhoneShow => _$this._isPhoneShow;
  set isPhoneShow(int? isPhoneShow) => _$this._isPhoneShow = isPhoneShow;

  int? _isEmailShow;
  int? get isEmailShow => _$this._isEmailShow;
  set isEmailShow(int? isEmailShow) => _$this._isEmailShow = isEmailShow;

  int? _isFaceBookShow;
  int? get isFaceBookShow => _$this._isFaceBookShow;
  set isFaceBookShow(int? isFaceBookShow) =>
      _$this._isFaceBookShow = isFaceBookShow;

  int? _isLinkedInShow;
  int? get isLinkedInShow => _$this._isLinkedInShow;
  set isLinkedInShow(int? isLinkedInShow) =>
      _$this._isLinkedInShow = isLinkedInShow;

  int? _isInstagramShow;
  int? get isInstagramShow => _$this._isInstagramShow;
  set isInstagramShow(int? isInstagramShow) =>
      _$this._isInstagramShow = isInstagramShow;

  int? _isSnapchatShow;
  int? get isSnapchatShow => _$this._isSnapchatShow;
  set isSnapchatShow(int? isSnapchatShow) =>
      _$this._isSnapchatShow = isSnapchatShow;

  int? _isTwitterShow;
  int? get isTwitterShow => _$this._isTwitterShow;
  set isTwitterShow(int? isTwitterShow) =>
      _$this._isTwitterShow = isTwitterShow;

  int? _isYoutubeShow;
  int? get isYoutubeShow => _$this._isYoutubeShow;
  set isYoutubeShow(int? isYoutubeShow) =>
      _$this._isYoutubeShow = isYoutubeShow;

  int? _isWhatsappShow;
  int? get isWhatsappShow => _$this._isWhatsappShow;
  set isWhatsappShow(int? isWhatsappShow) =>
      _$this._isWhatsappShow = isWhatsappShow;

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

  String? _whatsapp;
  String? get whatsapp => _$this._whatsapp;
  set whatsapp(String? whatsapp) => _$this._whatsapp = whatsapp;

  ListBuilder<SkillModel>? _skills;
  ListBuilder<SkillModel> get skills =>
      _$this._skills ??= new ListBuilder<SkillModel>();
  set skills(ListBuilder<SkillModel>? skills) => _$this._skills = skills;

  String? _firebaseToken;
  String? get firebaseToken => _$this._firebaseToken;
  set firebaseToken(String? firebaseToken) =>
      _$this._firebaseToken = firebaseToken;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  UserModelBuilder();

  UserModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _email = $v.email;
      _phoneNumber = $v.phoneNumber;
      _address = $v.address;
      _birthDate = $v.birthDate;
      _avatar = $v.avatar;
      _gender = $v.gender;
      _cityId = $v.cityId;
      _city = $v.city?.toBuilder();
      _isCompleted = $v.isCompleted;
      _countryId = $v.countryId;
      _country = $v.country?.toBuilder();
      _summary = $v.summary;
      _isPhoneShow = $v.isPhoneShow;
      _isEmailShow = $v.isEmailShow;
      _isFaceBookShow = $v.isFaceBookShow;
      _isLinkedInShow = $v.isLinkedInShow;
      _isInstagramShow = $v.isInstagramShow;
      _isSnapchatShow = $v.isSnapchatShow;
      _isTwitterShow = $v.isTwitterShow;
      _isYoutubeShow = $v.isYoutubeShow;
      _isWhatsappShow = $v.isWhatsappShow;
      _facebook = $v.facebook;
      _youtube = $v.youtube;
      _instagram = $v.instagram;
      _linkedin = $v.linkedin;
      _twitter = $v.twitter;
      _snapchat = $v.snapchat;
      _whatsapp = $v.whatsapp;
      _skills = $v.skills?.toBuilder();
      _firebaseToken = $v.firebaseToken;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserModel;
  }

  @override
  void update(void Function(UserModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserModel build() => _build();

  _$UserModel _build() {
    _$UserModel _$result;
    try {
      _$result = _$v ??
          new _$UserModel._(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phoneNumber: phoneNumber,
            address: address,
            birthDate: birthDate,
            avatar: avatar,
            gender: gender,
            cityId: cityId,
            city: _city?.build(),
            isCompleted: isCompleted,
            countryId: countryId,
            country: _country?.build(),
            summary: summary,
            isPhoneShow: isPhoneShow,
            isEmailShow: isEmailShow,
            isFaceBookShow: isFaceBookShow,
            isLinkedInShow: isLinkedInShow,
            isInstagramShow: isInstagramShow,
            isSnapchatShow: isSnapchatShow,
            isTwitterShow: isTwitterShow,
            isYoutubeShow: isYoutubeShow,
            isWhatsappShow: isWhatsappShow,
            facebook: facebook,
            youtube: youtube,
            instagram: instagram,
            linkedin: linkedin,
            twitter: twitter,
            snapchat: snapchat,
            whatsapp: whatsapp,
            skills: _skills?.build(),
            firebaseToken: firebaseToken,
            createdAt: createdAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'city';
        _city?.build();

        _$failedField = 'country';
        _country?.build();

        _$failedField = 'skills';
        _skills?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
