// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProductModel extends ProductModel {
  @override
  final int? id;
  @override
  final String slug;
  @override
  final double? price;
  @override
  final String? featuredImage;
  @override
  final BuiltList<String>? images;
  @override
  final bool? canBeOrdered;
  @override
  final bool? hasPendingOrder;
  @override
  final int? rate;
  @override
  final bool? isNew;
  @override
  final int? categoryId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? city_name;
  @override
  final String? country_name;
  @override
  final UserModel? user;
  @override
  final String? createdAt;

  factory _$ProductModel([void Function(ProductModelBuilder)? updates]) =>
      (new ProductModelBuilder()..update(updates))._build();

  _$ProductModel._(
      {this.id,
      required this.slug,
      this.price,
      this.featuredImage,
      this.images,
      this.canBeOrdered,
      this.hasPendingOrder,
      this.rate,
      this.isNew,
      this.categoryId,
      this.name,
      this.description,
      this.city_name,
      this.country_name,
      this.user,
      this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(slug, r'ProductModel', 'slug');
  }

  @override
  ProductModel rebuild(void Function(ProductModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductModelBuilder toBuilder() => new ProductModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductModel &&
        id == other.id &&
        slug == other.slug &&
        price == other.price &&
        featuredImage == other.featuredImage &&
        images == other.images &&
        canBeOrdered == other.canBeOrdered &&
        hasPendingOrder == other.hasPendingOrder &&
        rate == other.rate &&
        isNew == other.isNew &&
        categoryId == other.categoryId &&
        name == other.name &&
        description == other.description &&
        city_name == other.city_name &&
        country_name == other.country_name &&
        user == other.user &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, featuredImage.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, canBeOrdered.hashCode);
    _$hash = $jc(_$hash, hasPendingOrder.hashCode);
    _$hash = $jc(_$hash, rate.hashCode);
    _$hash = $jc(_$hash, isNew.hashCode);
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, city_name.hashCode);
    _$hash = $jc(_$hash, country_name.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductModel')
          ..add('id', id)
          ..add('slug', slug)
          ..add('price', price)
          ..add('featuredImage', featuredImage)
          ..add('images', images)
          ..add('canBeOrdered', canBeOrdered)
          ..add('hasPendingOrder', hasPendingOrder)
          ..add('rate', rate)
          ..add('isNew', isNew)
          ..add('categoryId', categoryId)
          ..add('name', name)
          ..add('description', description)
          ..add('city_name', city_name)
          ..add('country_name', country_name)
          ..add('user', user)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class ProductModelBuilder
    implements Builder<ProductModel, ProductModelBuilder> {
  _$ProductModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _featuredImage;
  String? get featuredImage => _$this._featuredImage;
  set featuredImage(String? featuredImage) =>
      _$this._featuredImage = featuredImage;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  bool? _canBeOrdered;
  bool? get canBeOrdered => _$this._canBeOrdered;
  set canBeOrdered(bool? canBeOrdered) => _$this._canBeOrdered = canBeOrdered;

  bool? _hasPendingOrder;
  bool? get hasPendingOrder => _$this._hasPendingOrder;
  set hasPendingOrder(bool? hasPendingOrder) =>
      _$this._hasPendingOrder = hasPendingOrder;

  int? _rate;
  int? get rate => _$this._rate;
  set rate(int? rate) => _$this._rate = rate;

  bool? _isNew;
  bool? get isNew => _$this._isNew;
  set isNew(bool? isNew) => _$this._isNew = isNew;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _city_name;
  String? get city_name => _$this._city_name;
  set city_name(String? city_name) => _$this._city_name = city_name;

  String? _country_name;
  String? get country_name => _$this._country_name;
  set country_name(String? country_name) => _$this._country_name = country_name;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  ProductModelBuilder();

  ProductModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _slug = $v.slug;
      _price = $v.price;
      _featuredImage = $v.featuredImage;
      _images = $v.images?.toBuilder();
      _canBeOrdered = $v.canBeOrdered;
      _hasPendingOrder = $v.hasPendingOrder;
      _rate = $v.rate;
      _isNew = $v.isNew;
      _categoryId = $v.categoryId;
      _name = $v.name;
      _description = $v.description;
      _city_name = $v.city_name;
      _country_name = $v.country_name;
      _user = $v.user?.toBuilder();
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductModel;
  }

  @override
  void update(void Function(ProductModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductModel build() => _build();

  _$ProductModel _build() {
    _$ProductModel _$result;
    try {
      _$result = _$v ??
          new _$ProductModel._(
            id: id,
            slug: BuiltValueNullFieldError.checkNotNull(
                slug, r'ProductModel', 'slug'),
            price: price,
            featuredImage: featuredImage,
            images: _images?.build(),
            canBeOrdered: canBeOrdered,
            hasPendingOrder: hasPendingOrder,
            rate: rate,
            isNew: isNew,
            categoryId: categoryId,
            name: name,
            description: description,
            city_name: city_name,
            country_name: country_name,
            user: _user?.build(),
            createdAt: createdAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();

        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProductModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
