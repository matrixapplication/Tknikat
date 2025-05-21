// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_products_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AllProductsState extends AllProductsState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final BuiltList<ProductModel> products;
  @override
  final Paginator paginator;

  factory _$AllProductsState(
          [void Function(AllProductsStateBuilder)? updates]) =>
      (new AllProductsStateBuilder()..update(updates))._build();

  _$AllProductsState._(
      {this.error,
      required this.isLoading,
      required this.products,
      required this.paginator})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'AllProductsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        products, r'AllProductsState', 'products');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'AllProductsState', 'paginator');
  }

  @override
  AllProductsState rebuild(void Function(AllProductsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllProductsStateBuilder toBuilder() =>
      new AllProductsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllProductsState &&
        error == other.error &&
        isLoading == other.isLoading &&
        products == other.products &&
        paginator == other.paginator;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, products.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AllProductsState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('products', products)
          ..add('paginator', paginator))
        .toString();
  }
}

class AllProductsStateBuilder
    implements Builder<AllProductsState, AllProductsStateBuilder> {
  _$AllProductsState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  ListBuilder<ProductModel>? _products;
  ListBuilder<ProductModel> get products =>
      _$this._products ??= new ListBuilder<ProductModel>();
  set products(ListBuilder<ProductModel>? products) =>
      _$this._products = products;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  AllProductsStateBuilder();

  AllProductsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _products = $v.products.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllProductsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllProductsState;
  }

  @override
  void update(void Function(AllProductsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllProductsState build() => _build();

  _$AllProductsState _build() {
    _$AllProductsState _$result;
    try {
      _$result = _$v ??
          new _$AllProductsState._(
            error: error,
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'AllProductsState', 'isLoading'),
            products: products.build(),
            paginator: paginator.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'products';
        products.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllProductsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
