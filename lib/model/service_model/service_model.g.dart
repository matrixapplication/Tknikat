// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ServiceModel extends ServiceModel {
  @override
  final int? id;
  @override
  final double? price;
  @override
  final String? slug;
  @override
  final String? featuredImage;
  @override
  final BuiltList<String>? images;
  @override
  final int? rate;
  @override
  final bool? isNew;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final UserModel? user;
  @override
  final String? createdAt;
  @override
  final String? city_name;
  @override
  final String? country_name;
  @override
  final int? categoryId;

  factory _$ServiceModel([void Function(ServiceModelBuilder)? updates]) =>
      (new ServiceModelBuilder()..update(updates))._build();

  _$ServiceModel._(
      {this.id,
      this.price,
      this.slug,
      this.featuredImage,
      this.images,
      this.rate,
      this.isNew,
      this.name,
      this.description,
      this.user,
      this.createdAt,
      this.city_name,
      this.country_name,
      this.categoryId})
      : super._();

  @override
  ServiceModel rebuild(void Function(ServiceModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceModelBuilder toBuilder() => new ServiceModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceModel &&
        id == other.id &&
        price == other.price &&
        slug == other.slug &&
        featuredImage == other.featuredImage &&
        images == other.images &&
        rate == other.rate &&
        isNew == other.isNew &&
        name == other.name &&
        description == other.description &&
        user == other.user &&
        createdAt == other.createdAt &&
        city_name == other.city_name &&
        country_name == other.country_name &&
        categoryId == other.categoryId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, featuredImage.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, isNew.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, city_name.hashCode);
    _$hash = $jc(_$hash, country_name.hashCode);
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceModel')
          ..add('id', id)
          ..add('price', price)
          ..add('slug', slug)
          ..add('featuredImage', featuredImage)
          ..add('images', images)
          ..add('rate', rate)
          ..add('isNew', isNew)
          ..add('name', name)
          ..add('description', description)
          ..add('user', user)
          ..add('createdAt', createdAt)
          ..add('city_name', city_name)
          ..add('country_name', country_name)
          ..add('categoryId', categoryId))
        .toString();
  }
}

class ServiceModelBuilder
    implements Builder<ServiceModel, ServiceModelBuilder> {
  _$ServiceModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  String? _featuredImage;
  String? get featuredImage => _$this._featuredImage;
  set featuredImage(String? featuredImage) =>
      _$this._featuredImage = featuredImage;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

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

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _city_name;
  String? get city_name => _$this._city_name;
  set city_name(String? city_name) => _$this._city_name = city_name;

  String? _country_name;
  String? get country_name => _$this._country_name;
  set country_name(String? country_name) => _$this._country_name = country_name;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  ServiceModelBuilder();

  ServiceModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _price = $v.price;
      _slug = $v.slug;
      _featuredImage = $v.featuredImage;
      _images = $v.images?.toBuilder();
      _rate = $v.rate;
      _isNew = $v.isNew;
      _name = $v.name;
      _description = $v.description;
      _user = $v.user?.toBuilder();
      _createdAt = $v.createdAt;
      _city_name = $v.city_name;
      _country_name = $v.country_name;
      _categoryId = $v.categoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceModel;
  }

  @override
  void update(void Function(ServiceModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceModel build() => _build();

  _$ServiceModel _build() {
    _$ServiceModel _$result;
    try {
      _$result = _$v ??
          new _$ServiceModel._(
              id: id,
              price: price,
              slug: slug,
              featuredImage: featuredImage,
              images: _images?.build(),
              rate: rate,
              isNew: isNew,
              name: name,
              description: description,
              user: _user?.build(),
              createdAt: createdAt,
              city_name: city_name,
              country_name: country_name,
              categoryId: categoryId);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
