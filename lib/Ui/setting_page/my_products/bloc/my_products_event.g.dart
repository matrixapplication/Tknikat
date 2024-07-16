// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_products_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitMyProducts extends InitMyProducts {
  factory _$InitMyProducts([void Function(InitMyProductsBuilder)? updates]) =>
      (new InitMyProductsBuilder()..update(updates))._build();

  _$InitMyProducts._() : super._();

  @override
  InitMyProducts rebuild(void Function(InitMyProductsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitMyProductsBuilder toBuilder() =>
      new InitMyProductsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitMyProducts;
  }

  @override
  int get hashCode {
    return 475254200;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'InitMyProducts').toString();
  }
}

class InitMyProductsBuilder
    implements Builder<InitMyProducts, InitMyProductsBuilder> {
  _$InitMyProducts? _$v;

  InitMyProductsBuilder();

  @override
  void replace(InitMyProducts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitMyProducts;
  }

  @override
  void update(void Function(InitMyProductsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitMyProducts build() => _build();

  _$InitMyProducts _build() {
    final _$result = _$v ?? new _$InitMyProducts._();
    replace(_$result);
    return _$result;
  }
}

class _$AddProduct extends AddProduct {
  @override
  final String title;
  @override
  final String description;
  @override
  final num price;
  @override
  final int categoryId;
  @override
  final int status;
  @override
  final File image;
  @override
  final List<File> images;

  factory _$AddProduct([void Function(AddProductBuilder)? updates]) =>
      (new AddProductBuilder()..update(updates))._build();

  _$AddProduct._(
      {required this.title,
      required this.description,
      required this.price,
      required this.categoryId,
      required this.status,
      required this.image,
      required this.images})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'AddProduct', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'AddProduct', 'description');
    BuiltValueNullFieldError.checkNotNull(price, r'AddProduct', 'price');
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'AddProduct', 'categoryId');
    BuiltValueNullFieldError.checkNotNull(status, r'AddProduct', 'status');
    BuiltValueNullFieldError.checkNotNull(image, r'AddProduct', 'image');
    BuiltValueNullFieldError.checkNotNull(images, r'AddProduct', 'images');
  }

  @override
  AddProduct rebuild(void Function(AddProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddProductBuilder toBuilder() => new AddProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddProduct &&
        title == other.title &&
        description == other.description &&
        price == other.price &&
        categoryId == other.categoryId &&
        status == other.status &&
        image == other.image &&
        images == other.images;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddProduct')
          ..add('title', title)
          ..add('description', description)
          ..add('price', price)
          ..add('categoryId', categoryId)
          ..add('status', status)
          ..add('image', image)
          ..add('images', images))
        .toString();
  }
}

class AddProductBuilder implements Builder<AddProduct, AddProductBuilder> {
  _$AddProduct? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  num? _price;
  num? get price => _$this._price;
  set price(num? price) => _$this._price = price;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  File? _image;
  File? get image => _$this._image;
  set image(File? image) => _$this._image = image;

  List<File>? _images;
  List<File>? get images => _$this._images;
  set images(List<File>? images) => _$this._images = images;

  AddProductBuilder();

  AddProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _price = $v.price;
      _categoryId = $v.categoryId;
      _status = $v.status;
      _image = $v.image;
      _images = $v.images;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddProduct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddProduct;
  }

  @override
  void update(void Function(AddProductBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddProduct build() => _build();

  _$AddProduct _build() {
    final _$result = _$v ??
        new _$AddProduct._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AddProduct', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'AddProduct', 'description'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'AddProduct', 'price'),
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'AddProduct', 'categoryId'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'AddProduct', 'status'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, r'AddProduct', 'image'),
            images: BuiltValueNullFieldError.checkNotNull(
                images, r'AddProduct', 'images'));
    replace(_$result);
    return _$result;
  }
}

class _$RemoveProduct extends RemoveProduct {
  @override
  final ProductModel product;

  factory _$RemoveProduct([void Function(RemoveProductBuilder)? updates]) =>
      (new RemoveProductBuilder()..update(updates))._build();

  _$RemoveProduct._({required this.product}) : super._() {
    BuiltValueNullFieldError.checkNotNull(product, r'RemoveProduct', 'product');
  }

  @override
  RemoveProduct rebuild(void Function(RemoveProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveProductBuilder toBuilder() => new RemoveProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveProduct && product == other.product;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, product.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RemoveProduct')
          ..add('product', product))
        .toString();
  }
}

class RemoveProductBuilder
    implements Builder<RemoveProduct, RemoveProductBuilder> {
  _$RemoveProduct? _$v;

  ProductModelBuilder? _product;
  ProductModelBuilder get product =>
      _$this._product ??= new ProductModelBuilder();
  set product(ProductModelBuilder? product) => _$this._product = product;

  RemoveProductBuilder();

  RemoveProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _product = $v.product.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoveProduct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RemoveProduct;
  }

  @override
  void update(void Function(RemoveProductBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RemoveProduct build() => _build();

  _$RemoveProduct _build() {
    _$RemoveProduct _$result;
    try {
      _$result = _$v ?? new _$RemoveProduct._(product: product.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'product';
        product.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RemoveProduct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EditProduct extends EditProduct {
  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String price;
  @override
  final int categoryId;
  @override
  final int status;
  @override
  final File image;
  @override
  final List<File> images;

  factory _$EditProduct([void Function(EditProductBuilder)? updates]) =>
      (new EditProductBuilder()..update(updates))._build();

  _$EditProduct._(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.categoryId,
      required this.status,
      required this.image,
      required this.images})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'EditProduct', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'EditProduct', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'EditProduct', 'description');
    BuiltValueNullFieldError.checkNotNull(price, r'EditProduct', 'price');
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'EditProduct', 'categoryId');
    BuiltValueNullFieldError.checkNotNull(status, r'EditProduct', 'status');
    BuiltValueNullFieldError.checkNotNull(image, r'EditProduct', 'image');
    BuiltValueNullFieldError.checkNotNull(images, r'EditProduct', 'images');
  }

  @override
  EditProduct rebuild(void Function(EditProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditProductBuilder toBuilder() => new EditProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditProduct &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        price == other.price &&
        categoryId == other.categoryId &&
        status == other.status &&
        image == other.image &&
        images == other.images;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EditProduct')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('price', price)
          ..add('categoryId', categoryId)
          ..add('status', status)
          ..add('image', image)
          ..add('images', images))
        .toString();
  }
}

class EditProductBuilder implements Builder<EditProduct, EditProductBuilder> {
  _$EditProduct? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _price;
  String? get price => _$this._price;
  set price(String? price) => _$this._price = price;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  File? _image;
  File? get image => _$this._image;
  set image(File? image) => _$this._image = image;

  List<File>? _images;
  List<File>? get images => _$this._images;
  set images(List<File>? images) => _$this._images = images;

  EditProductBuilder();

  EditProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _price = $v.price;
      _categoryId = $v.categoryId;
      _status = $v.status;
      _image = $v.image;
      _images = $v.images;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditProduct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EditProduct;
  }

  @override
  void update(void Function(EditProductBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EditProduct build() => _build();

  _$EditProduct _build() {
    final _$result = _$v ??
        new _$EditProduct._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'EditProduct', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'EditProduct', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'EditProduct', 'description'),
            price: BuiltValueNullFieldError.checkNotNull(
                price, r'EditProduct', 'price'),
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'EditProduct', 'categoryId'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'EditProduct', 'status'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, r'EditProduct', 'image'),
            images: BuiltValueNullFieldError.checkNotNull(
                images, r'EditProduct', 'images'));
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

class _$GetMyProducts extends GetMyProducts {
  factory _$GetMyProducts([void Function(GetMyProductsBuilder)? updates]) =>
      (new GetMyProductsBuilder()..update(updates))._build();

  _$GetMyProducts._() : super._();

  @override
  GetMyProducts rebuild(void Function(GetMyProductsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetMyProductsBuilder toBuilder() => new GetMyProductsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetMyProducts;
  }

  @override
  int get hashCode {
    return 4935330;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetMyProducts').toString();
  }
}

class GetMyProductsBuilder
    implements Builder<GetMyProducts, GetMyProductsBuilder> {
  _$GetMyProducts? _$v;

  GetMyProductsBuilder();

  @override
  void replace(GetMyProducts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetMyProducts;
  }

  @override
  void update(void Function(GetMyProductsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetMyProducts build() => _build();

  _$GetMyProducts _build() {
    final _$result = _$v ?? new _$GetMyProducts._();
    replace(_$result);
    return _$result;
  }
}

class _$GetNextMyProducts extends GetNextMyProducts {
  factory _$GetNextMyProducts(
          [void Function(GetNextMyProductsBuilder)? updates]) =>
      (new GetNextMyProductsBuilder()..update(updates))._build();

  _$GetNextMyProducts._() : super._();

  @override
  GetNextMyProducts rebuild(void Function(GetNextMyProductsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNextMyProductsBuilder toBuilder() =>
      new GetNextMyProductsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNextMyProducts;
  }

  @override
  int get hashCode {
    return 301456870;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetNextMyProducts').toString();
  }
}

class GetNextMyProductsBuilder
    implements Builder<GetNextMyProducts, GetNextMyProductsBuilder> {
  _$GetNextMyProducts? _$v;

  GetNextMyProductsBuilder();

  @override
  void replace(GetNextMyProducts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNextMyProducts;
  }

  @override
  void update(void Function(GetNextMyProductsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNextMyProducts build() => _build();

  _$GetNextMyProducts _build() {
    final _$result = _$v ?? new _$GetNextMyProducts._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
