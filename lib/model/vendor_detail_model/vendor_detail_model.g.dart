// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_detail_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VendorDetailModel> _$vendorDetailModelSerializer =
    new _$VendorDetailModelSerializer();

class _$VendorDetailModelSerializer
    implements StructuredSerializer<VendorDetailModel> {
  @override
  final Iterable<Type> types = const [VendorDetailModel, _$VendorDetailModel];
  @override
  final String wireName = 'VendorDetailModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, VendorDetailModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.vendorProducts;
    if (value != null) {
      result
        ..add('products')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ProductModel)])));
    }
    value = object.vendorProjects;
    if (value != null) {
      result
        ..add('projects')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ProjectModel)])));
    }
    value = object.vendorServices;
    if (value != null) {
      result
        ..add('services')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ServiceModel)])));
    }
    value = object.vendorPosts;
    if (value != null) {
      result
        ..add('posts')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(PostModel)])));
    }
    value = object.vendorShares;
    if (value != null) {
      result
        ..add('shares')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(ShareModel)])));
    }
    return result;
  }

  @override
  VendorDetailModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VendorDetailModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'products':
          result.vendorProducts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductModel)]))!
              as BuiltList<Object?>);
          break;
        case 'projects':
          result.vendorProjects.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProjectModel)]))!
              as BuiltList<Object?>);
          break;
        case 'services':
          result.vendorServices.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ServiceModel)]))!
              as BuiltList<Object?>);
          break;
        case 'posts':
          result.vendorPosts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PostModel)]))!
              as BuiltList<Object?>);
          break;
        case 'shares':
          result.vendorShares.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ShareModel)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$VendorDetailModel extends VendorDetailModel {
  @override
  final BuiltList<ProductModel>? vendorProducts;
  @override
  final BuiltList<ProjectModel>? vendorProjects;
  @override
  final BuiltList<ServiceModel>? vendorServices;
  @override
  final BuiltList<PostModel>? vendorPosts;
  @override
  final BuiltList<ShareModel>? vendorShares;

  factory _$VendorDetailModel(
          [void Function(VendorDetailModelBuilder)? updates]) =>
      (new VendorDetailModelBuilder()..update(updates))._build();

  _$VendorDetailModel._(
      {this.vendorProducts,
      this.vendorProjects,
      this.vendorServices,
      this.vendorPosts,
      this.vendorShares})
      : super._();

  @override
  VendorDetailModel rebuild(void Function(VendorDetailModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VendorDetailModelBuilder toBuilder() =>
      new VendorDetailModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VendorDetailModel &&
        vendorProducts == other.vendorProducts &&
        vendorProjects == other.vendorProjects &&
        vendorServices == other.vendorServices &&
        vendorPosts == other.vendorPosts &&
        vendorShares == other.vendorShares;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vendorProducts.hashCode);
    _$hash = $jc(_$hash, vendorProjects.hashCode);
    _$hash = $jc(_$hash, vendorServices.hashCode);
    _$hash = $jc(_$hash, vendorPosts.hashCode);
    _$hash = $jc(_$hash, vendorShares.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VendorDetailModel')
          ..add('vendorProducts', vendorProducts)
          ..add('vendorProjects', vendorProjects)
          ..add('vendorServices', vendorServices)
          ..add('vendorPosts', vendorPosts)
          ..add('vendorShares', vendorShares))
        .toString();
  }
}

class VendorDetailModelBuilder
    implements Builder<VendorDetailModel, VendorDetailModelBuilder> {
  _$VendorDetailModel? _$v;

  ListBuilder<ProductModel>? _vendorProducts;
  ListBuilder<ProductModel> get vendorProducts =>
      _$this._vendorProducts ??= new ListBuilder<ProductModel>();
  set vendorProducts(ListBuilder<ProductModel>? vendorProducts) =>
      _$this._vendorProducts = vendorProducts;

  ListBuilder<ProjectModel>? _vendorProjects;
  ListBuilder<ProjectModel> get vendorProjects =>
      _$this._vendorProjects ??= new ListBuilder<ProjectModel>();
  set vendorProjects(ListBuilder<ProjectModel>? vendorProjects) =>
      _$this._vendorProjects = vendorProjects;

  ListBuilder<ServiceModel>? _vendorServices;
  ListBuilder<ServiceModel> get vendorServices =>
      _$this._vendorServices ??= new ListBuilder<ServiceModel>();
  set vendorServices(ListBuilder<ServiceModel>? vendorServices) =>
      _$this._vendorServices = vendorServices;

  ListBuilder<PostModel>? _vendorPosts;
  ListBuilder<PostModel> get vendorPosts =>
      _$this._vendorPosts ??= new ListBuilder<PostModel>();
  set vendorPosts(ListBuilder<PostModel>? vendorPosts) =>
      _$this._vendorPosts = vendorPosts;

  ListBuilder<ShareModel>? _vendorShares;
  ListBuilder<ShareModel> get vendorShares =>
      _$this._vendorShares ??= new ListBuilder<ShareModel>();
  set vendorShares(ListBuilder<ShareModel>? vendorShares) =>
      _$this._vendorShares = vendorShares;

  VendorDetailModelBuilder();

  VendorDetailModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vendorProducts = $v.vendorProducts?.toBuilder();
      _vendorProjects = $v.vendorProjects?.toBuilder();
      _vendorServices = $v.vendorServices?.toBuilder();
      _vendorPosts = $v.vendorPosts?.toBuilder();
      _vendorShares = $v.vendorShares?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VendorDetailModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VendorDetailModel;
  }

  @override
  void update(void Function(VendorDetailModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VendorDetailModel build() => _build();

  _$VendorDetailModel _build() {
    _$VendorDetailModel _$result;
    try {
      _$result = _$v ??
          new _$VendorDetailModel._(
              vendorProducts: _vendorProducts?.build(),
              vendorProjects: _vendorProjects?.build(),
              vendorServices: _vendorServices?.build(),
              vendorPosts: _vendorPosts?.build(),
              vendorShares: _vendorShares?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vendorProducts';
        _vendorProducts?.build();
        _$failedField = 'vendorProjects';
        _vendorProjects?.build();
        _$failedField = 'vendorServices';
        _vendorServices?.build();
        _$failedField = 'vendorPosts';
        _vendorPosts?.build();
        _$failedField = 'vendorShares';
        _vendorShares?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VendorDetailModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
