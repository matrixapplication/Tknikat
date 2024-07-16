// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProjectModel extends ProjectModel {
  @override
  final int? id;
  @override
  final int? userId;
  @override
  final String? slug;
  @override
  final String? featuredImage;
  @override
  final String? youtubeLink;
  @override
  final int? rate;
  @override
  final bool? isNew;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? updatedAt;
  @override
  final String? createdAt;
  @override
  final String? projectDate;
  @override
  final String? city_name;
  @override
  final String? country_name;
  @override
  final UserModel? user;

  factory _$ProjectModel([void Function(ProjectModelBuilder)? updates]) =>
      (new ProjectModelBuilder()..update(updates))._build();

  _$ProjectModel._(
      {this.id,
      this.userId,
      this.slug,
      this.featuredImage,
      this.youtubeLink,
      this.rate,
      this.isNew,
      this.name,
      this.description,
      this.updatedAt,
      this.createdAt,
      this.projectDate,
      this.city_name,
      this.country_name,
      this.user})
      : super._();

  @override
  ProjectModel rebuild(void Function(ProjectModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectModelBuilder toBuilder() => new ProjectModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProjectModel &&
        id == other.id &&
        userId == other.userId &&
        slug == other.slug &&
        featuredImage == other.featuredImage &&
        youtubeLink == other.youtubeLink &&
        rate == other.rate &&
        isNew == other.isNew &&
        name == other.name &&
        description == other.description &&
        updatedAt == other.updatedAt &&
        createdAt == other.createdAt &&
        projectDate == other.projectDate &&
        city_name == other.city_name &&
        country_name == other.country_name &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, featuredImage.hashCode);
    _$hash = $jc(_$hash, youtubeLink.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, isNew.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, projectDate.hashCode);
    _$hash = $jc(_$hash, city_name.hashCode);
    _$hash = $jc(_$hash, country_name.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProjectModel')
          ..add('id', id)
          ..add('userId', userId)
          ..add('slug', slug)
          ..add('featuredImage', featuredImage)
          ..add('youtubeLink', youtubeLink)
          ..add('rate', rate)
          ..add('isNew', isNew)
          ..add('name', name)
          ..add('description', description)
          ..add('updatedAt', updatedAt)
          ..add('createdAt', createdAt)
          ..add('projectDate', projectDate)
          ..add('city_name', city_name)
          ..add('country_name', country_name)
          ..add('user', user))
        .toString();
  }
}

class ProjectModelBuilder
    implements Builder<ProjectModel, ProjectModelBuilder> {
  _$ProjectModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _featuredImage;
  String? get featuredImage => _$this._featuredImage;
  set featuredImage(String? featuredImage) =>
      _$this._featuredImage = featuredImage;

  String? _youtubeLink;
  String? get youtubeLink => _$this._youtubeLink;
  set youtubeLink(String? youtubeLink) => _$this._youtubeLink = youtubeLink;

  int? _rate;
  int? get rate => _$this._rate;
  set rate(int? rate) => _$this._rate = rate;

  bool? _isNew;
  bool? get isNew => _$this._isNew;
  set isNew(bool? isNew) => _$this._isNew = isNew;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _projectDate;
  String? get projectDate => _$this._projectDate;
  set projectDate(String? projectDate) => _$this._projectDate = projectDate;

  String? _city_name;
  String? get city_name => _$this._city_name;
  set city_name(String? city_name) => _$this._city_name = city_name;

  String? _country_name;
  String? get country_name => _$this._country_name;
  set country_name(String? country_name) => _$this._country_name = country_name;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  ProjectModelBuilder();

  ProjectModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userId = $v.userId;
      _slug = $v.slug;
      _featuredImage = $v.featuredImage;
      _youtubeLink = $v.youtubeLink;
      _rate = $v.rate;
      _isNew = $v.isNew;
      _name = $v.name;
      _description = $v.description;
      _updatedAt = $v.updatedAt;
      _createdAt = $v.createdAt;
      _projectDate = $v.projectDate;
      _city_name = $v.city_name;
      _country_name = $v.country_name;
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProjectModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProjectModel;
  }

  @override
  void update(void Function(ProjectModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProjectModel build() => _build();

  _$ProjectModel _build() {
    _$ProjectModel _$result;
    try {
      _$result = _$v ??
          new _$ProjectModel._(
              id: id,
              userId: userId,
              slug: slug,
              featuredImage: featuredImage,
              youtubeLink: youtubeLink,
              rate: rate,
              isNew: isNew,
              name: name,
              description: description,
              updatedAt: updatedAt,
              createdAt: createdAt,
              projectDate: projectDate,
              city_name: city_name,
              country_name: country_name,
              user: _user?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProjectModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
