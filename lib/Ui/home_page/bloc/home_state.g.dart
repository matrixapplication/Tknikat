// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final BuiltList<ProductModel> newProducts;
  @override
  final BuiltList<ServiceModel> newServices;
  @override
  final BuiltList<ProjectModel> newProjects;
  @override
  final BuiltList<ShareModel> newShares;
  @override
  final String? aboutus;
  @override
  final String? terms;
  @override
  final bool success;
  @override
  final bool initialized;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates))._build();

  _$HomeState._(
      {this.error,
      required this.isLoading,
      required this.newProducts,
      required this.newServices,
      required this.newProjects,
      required this.newShares,
      this.aboutus,
      this.terms,
      required this.success,
      required this.initialized})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(isLoading, r'HomeState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        newProducts, r'HomeState', 'newProducts');
    BuiltValueNullFieldError.checkNotNull(
        newServices, r'HomeState', 'newServices');
    BuiltValueNullFieldError.checkNotNull(
        newProjects, r'HomeState', 'newProjects');
    BuiltValueNullFieldError.checkNotNull(newShares, r'HomeState', 'newShares');
    BuiltValueNullFieldError.checkNotNull(success, r'HomeState', 'success');
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'HomeState', 'initialized');
  }

  @override
  HomeState rebuild(void Function(HomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStateBuilder toBuilder() => new HomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeState &&
        error == other.error &&
        isLoading == other.isLoading &&
        newProducts == other.newProducts &&
        newServices == other.newServices &&
        newProjects == other.newProjects &&
        newShares == other.newShares &&
        aboutus == other.aboutus &&
        terms == other.terms &&
        success == other.success &&
        initialized == other.initialized;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, newProducts.hashCode);
    _$hash = $jc(_$hash, newServices.hashCode);
    _$hash = $jc(_$hash, newProjects.hashCode);
    _$hash = $jc(_$hash, newShares.hashCode);
    _$hash = $jc(_$hash, aboutus.hashCode);
    _$hash = $jc(_$hash, terms.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomeState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('newProducts', newProducts)
          ..add('newServices', newServices)
          ..add('newProjects', newProjects)
          ..add('newShares', newShares)
          ..add('aboutus', aboutus)
          ..add('terms', terms)
          ..add('success', success)
          ..add('initialized', initialized))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  ListBuilder<ProductModel>? _newProducts;
  ListBuilder<ProductModel> get newProducts =>
      _$this._newProducts ??= new ListBuilder<ProductModel>();
  set newProducts(ListBuilder<ProductModel>? newProducts) =>
      _$this._newProducts = newProducts;

  ListBuilder<ServiceModel>? _newServices;
  ListBuilder<ServiceModel> get newServices =>
      _$this._newServices ??= new ListBuilder<ServiceModel>();
  set newServices(ListBuilder<ServiceModel>? newServices) =>
      _$this._newServices = newServices;

  ListBuilder<ProjectModel>? _newProjects;
  ListBuilder<ProjectModel> get newProjects =>
      _$this._newProjects ??= new ListBuilder<ProjectModel>();
  set newProjects(ListBuilder<ProjectModel>? newProjects) =>
      _$this._newProjects = newProjects;

  ListBuilder<ShareModel>? _newShares;
  ListBuilder<ShareModel> get newShares =>
      _$this._newShares ??= new ListBuilder<ShareModel>();
  set newShares(ListBuilder<ShareModel>? newShares) =>
      _$this._newShares = newShares;

  String? _aboutus;
  String? get aboutus => _$this._aboutus;
  set aboutus(String? aboutus) => _$this._aboutus = aboutus;

  String? _terms;
  String? get terms => _$this._terms;
  set terms(String? terms) => _$this._terms = terms;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _newProducts = $v.newProducts.toBuilder();
      _newServices = $v.newServices.toBuilder();
      _newProjects = $v.newProjects.toBuilder();
      _newShares = $v.newShares.toBuilder();
      _aboutus = $v.aboutus;
      _terms = $v.terms;
      _success = $v.success;
      _initialized = $v.initialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HomeState build() => _build();

  _$HomeState _build() {
    _$HomeState _$result;
    try {
      _$result = _$v ??
          new _$HomeState._(
              error: error,
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'HomeState', 'isLoading'),
              newProducts: newProducts.build(),
              newServices: newServices.build(),
              newProjects: newProjects.build(),
              newShares: newShares.build(),
              aboutus: aboutus,
              terms: terms,
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'HomeState', 'success'),
              initialized: BuiltValueNullFieldError.checkNotNull(
                  initialized, r'HomeState', 'initialized'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'newProducts';
        newProducts.build();
        _$failedField = 'newServices';
        newServices.build();
        _$failedField = 'newProjects';
        newProjects.build();
        _$failedField = 'newShares';
        newShares.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'HomeState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
