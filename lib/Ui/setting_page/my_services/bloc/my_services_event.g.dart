// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_services_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitMyServices extends InitMyServices {
  factory _$InitMyServices([void Function(InitMyServicesBuilder)? updates]) =>
      (new InitMyServicesBuilder()..update(updates))._build();

  _$InitMyServices._() : super._();

  @override
  InitMyServices rebuild(void Function(InitMyServicesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitMyServicesBuilder toBuilder() =>
      new InitMyServicesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitMyServices;
  }

  @override
  int get hashCode {
    return 576790503;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'InitMyServices').toString();
  }
}

class InitMyServicesBuilder
    implements Builder<InitMyServices, InitMyServicesBuilder> {
  _$InitMyServices? _$v;

  InitMyServicesBuilder();

  @override
  void replace(InitMyServices other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitMyServices;
  }

  @override
  void update(void Function(InitMyServicesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitMyServices build() => _build();

  _$InitMyServices _build() {
    final _$result = _$v ?? new _$InitMyServices._();
    replace(_$result);
    return _$result;
  }
}

class _$AddService extends AddService {
  @override
  final String title;
  @override
  final String description;
  @override
  final String price;
  @override
  final int categoryId;
  @override
  final File? image;
  @override
  final List<File>? images;

  factory _$AddService([void Function(AddServiceBuilder)? updates]) =>
      (new AddServiceBuilder()..update(updates))._build();

  _$AddService._(
      {required this.title,
      required this.description,
      required this.price,
      required this.categoryId,
      this.image,
      this.images})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'AddService', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'AddService', 'description');
    BuiltValueNullFieldError.checkNotNull(price, r'AddService', 'price');
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'AddService', 'categoryId');
  }

  @override
  AddService rebuild(void Function(AddServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddServiceBuilder toBuilder() => new AddServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddService &&
        title == other.title &&
        description == other.description &&
        price == other.price &&
        categoryId == other.categoryId &&
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
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddService')
          ..add('title', title)
          ..add('description', description)
          ..add('price', price)
          ..add('categoryId', categoryId)
          ..add('image', image)
          ..add('images', images))
        .toString();
  }
}

class AddServiceBuilder implements Builder<AddService, AddServiceBuilder> {
  _$AddService? _$v;

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

  File? _image;
  File? get image => _$this._image;
  set image(File? image) => _$this._image = image;

  List<File>? _images;
  List<File>? get images => _$this._images;
  set images(List<File>? images) => _$this._images = images;

  AddServiceBuilder();

  AddServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _price = $v.price;
      _categoryId = $v.categoryId;
      _image = $v.image;
      _images = $v.images;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddService other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddService;
  }

  @override
  void update(void Function(AddServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddService build() => _build();

  _$AddService _build() {
    final _$result = _$v ??
        new _$AddService._(
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'AddService', 'title'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'AddService', 'description'),
          price: BuiltValueNullFieldError.checkNotNull(
              price, r'AddService', 'price'),
          categoryId: BuiltValueNullFieldError.checkNotNull(
              categoryId, r'AddService', 'categoryId'),
          image: image,
          images: images,
        );
    replace(_$result);
    return _$result;
  }
}

class _$RemoveService extends RemoveService {
  @override
  final ServiceModel service;

  factory _$RemoveService([void Function(RemoveServiceBuilder)? updates]) =>
      (new RemoveServiceBuilder()..update(updates))._build();

  _$RemoveService._({required this.service}) : super._() {
    BuiltValueNullFieldError.checkNotNull(service, r'RemoveService', 'service');
  }

  @override
  RemoveService rebuild(void Function(RemoveServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveServiceBuilder toBuilder() => new RemoveServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveService && service == other.service;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, service.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RemoveService')
          ..add('service', service))
        .toString();
  }
}

class RemoveServiceBuilder
    implements Builder<RemoveService, RemoveServiceBuilder> {
  _$RemoveService? _$v;

  ServiceModelBuilder? _service;
  ServiceModelBuilder get service =>
      _$this._service ??= new ServiceModelBuilder();
  set service(ServiceModelBuilder? service) => _$this._service = service;

  RemoveServiceBuilder();

  RemoveServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _service = $v.service.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoveService other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RemoveService;
  }

  @override
  void update(void Function(RemoveServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RemoveService build() => _build();

  _$RemoveService _build() {
    _$RemoveService _$result;
    try {
      _$result = _$v ??
          new _$RemoveService._(
            service: service.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'service';
        service.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RemoveService', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EditService extends EditService {
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
  final File? image;
  @override
  final List<File>? images;
  @override
  final List<String>? deleteImages;

  factory _$EditService([void Function(EditServiceBuilder)? updates]) =>
      (new EditServiceBuilder()..update(updates))._build();

  _$EditService._(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.categoryId,
      this.image,
      this.images,
      this.deleteImages})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'EditService', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'EditService', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'EditService', 'description');
    BuiltValueNullFieldError.checkNotNull(price, r'EditService', 'price');
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'EditService', 'categoryId');
  }

  @override
  EditService rebuild(void Function(EditServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditServiceBuilder toBuilder() => new EditServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditService &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        price == other.price &&
        categoryId == other.categoryId &&
        image == other.image &&
        images == other.images &&
        deleteImages == other.deleteImages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, deleteImages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EditService')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('price', price)
          ..add('categoryId', categoryId)
          ..add('image', image)
          ..add('images', images)
          ..add('deleteImages', deleteImages))
        .toString();
  }
}

class EditServiceBuilder implements Builder<EditService, EditServiceBuilder> {
  _$EditService? _$v;

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

  File? _image;
  File? get image => _$this._image;
  set image(File? image) => _$this._image = image;

  List<File>? _images;
  List<File>? get images => _$this._images;
  set images(List<File>? images) => _$this._images = images;

  List<String>? _deleteImages;
  List<String>? get deleteImages => _$this._deleteImages;
  set deleteImages(List<String>? deleteImages) =>
      _$this._deleteImages = deleteImages;

  EditServiceBuilder();

  EditServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _price = $v.price;
      _categoryId = $v.categoryId;
      _image = $v.image;
      _images = $v.images;
      _deleteImages = $v.deleteImages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditService other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EditService;
  }

  @override
  void update(void Function(EditServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EditService build() => _build();

  _$EditService _build() {
    final _$result = _$v ??
        new _$EditService._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'EditService', 'id'),
          title: BuiltValueNullFieldError.checkNotNull(
              title, r'EditService', 'title'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'EditService', 'description'),
          price: BuiltValueNullFieldError.checkNotNull(
              price, r'EditService', 'price'),
          categoryId: BuiltValueNullFieldError.checkNotNull(
              categoryId, r'EditService', 'categoryId'),
          image: image,
          images: images,
          deleteImages: deleteImages,
        );
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

class _$GetMyServices extends GetMyServices {
  factory _$GetMyServices([void Function(GetMyServicesBuilder)? updates]) =>
      (new GetMyServicesBuilder()..update(updates))._build();

  _$GetMyServices._() : super._();

  @override
  GetMyServices rebuild(void Function(GetMyServicesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetMyServicesBuilder toBuilder() => new GetMyServicesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetMyServices;
  }

  @override
  int get hashCode {
    return 505897408;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetMyServices').toString();
  }
}

class GetMyServicesBuilder
    implements Builder<GetMyServices, GetMyServicesBuilder> {
  _$GetMyServices? _$v;

  GetMyServicesBuilder();

  @override
  void replace(GetMyServices other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetMyServices;
  }

  @override
  void update(void Function(GetMyServicesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetMyServices build() => _build();

  _$GetMyServices _build() {
    final _$result = _$v ?? new _$GetMyServices._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
