// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_products_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MyProductsState extends MyProductsState {
  @override
  final bool isLoading;
  @override
  final bool addSuccess;
  @override
  final bool editSuccess;
  @override
  final bool removeSuccess;
  @override
  final String? error;
  @override
  final BuiltList<ProductModel> myProducts;
  @override
  final Paginator paginator;
  @override
  final bool initialized;

  factory _$MyProductsState([void Function(MyProductsStateBuilder)? updates]) =>
      (new MyProductsStateBuilder()..update(updates))._build();

  _$MyProductsState._(
      {required this.isLoading,
      required this.addSuccess,
      required this.editSuccess,
      required this.removeSuccess,
      this.error,
      required this.myProducts,
      required this.paginator,
      required this.initialized})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'MyProductsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        addSuccess, r'MyProductsState', 'addSuccess');
    BuiltValueNullFieldError.checkNotNull(
        editSuccess, r'MyProductsState', 'editSuccess');
    BuiltValueNullFieldError.checkNotNull(
        removeSuccess, r'MyProductsState', 'removeSuccess');
    BuiltValueNullFieldError.checkNotNull(
        myProducts, r'MyProductsState', 'myProducts');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'MyProductsState', 'paginator');
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'MyProductsState', 'initialized');
  }

  @override
  MyProductsState rebuild(void Function(MyProductsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyProductsStateBuilder toBuilder() =>
      new MyProductsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyProductsState &&
        isLoading == other.isLoading &&
        addSuccess == other.addSuccess &&
        editSuccess == other.editSuccess &&
        removeSuccess == other.removeSuccess &&
        error == other.error &&
        myProducts == other.myProducts &&
        paginator == other.paginator &&
        initialized == other.initialized;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, addSuccess.hashCode);
    _$hash = $jc(_$hash, editSuccess.hashCode);
    _$hash = $jc(_$hash, removeSuccess.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, myProducts.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyProductsState')
          ..add('isLoading', isLoading)
          ..add('addSuccess', addSuccess)
          ..add('editSuccess', editSuccess)
          ..add('removeSuccess', removeSuccess)
          ..add('error', error)
          ..add('myProducts', myProducts)
          ..add('paginator', paginator)
          ..add('initialized', initialized))
        .toString();
  }
}

class MyProductsStateBuilder
    implements Builder<MyProductsState, MyProductsStateBuilder> {
  _$MyProductsState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _addSuccess;
  bool? get addSuccess => _$this._addSuccess;
  set addSuccess(bool? addSuccess) => _$this._addSuccess = addSuccess;

  bool? _editSuccess;
  bool? get editSuccess => _$this._editSuccess;
  set editSuccess(bool? editSuccess) => _$this._editSuccess = editSuccess;

  bool? _removeSuccess;
  bool? get removeSuccess => _$this._removeSuccess;
  set removeSuccess(bool? removeSuccess) =>
      _$this._removeSuccess = removeSuccess;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  ListBuilder<ProductModel>? _myProducts;
  ListBuilder<ProductModel> get myProducts =>
      _$this._myProducts ??= new ListBuilder<ProductModel>();
  set myProducts(ListBuilder<ProductModel>? myProducts) =>
      _$this._myProducts = myProducts;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  MyProductsStateBuilder();

  MyProductsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _addSuccess = $v.addSuccess;
      _editSuccess = $v.editSuccess;
      _removeSuccess = $v.removeSuccess;
      _error = $v.error;
      _myProducts = $v.myProducts.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _initialized = $v.initialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyProductsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyProductsState;
  }

  @override
  void update(void Function(MyProductsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyProductsState build() => _build();

  _$MyProductsState _build() {
    _$MyProductsState _$result;
    try {
      _$result = _$v ??
          new _$MyProductsState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'MyProductsState', 'isLoading'),
            addSuccess: BuiltValueNullFieldError.checkNotNull(
                addSuccess, r'MyProductsState', 'addSuccess'),
            editSuccess: BuiltValueNullFieldError.checkNotNull(
                editSuccess, r'MyProductsState', 'editSuccess'),
            removeSuccess: BuiltValueNullFieldError.checkNotNull(
                removeSuccess, r'MyProductsState', 'removeSuccess'),
            error: error,
            myProducts: myProducts.build(),
            paginator: paginator.build(),
            initialized: BuiltValueNullFieldError.checkNotNull(
                initialized, r'MyProductsState', 'initialized'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'myProducts';
        myProducts.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MyProductsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
