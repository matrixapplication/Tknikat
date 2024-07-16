// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VendorState extends VendorState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final bool success;
  @override
  final UserModel vendor;
  @override
  final BuiltList<ProductModel> products;
  @override
  final BuiltList<ProjectModel> projects;
  @override
  final BuiltList<ServiceModel> services;
  @override
  final BuiltList<ShareModel> shares;
  @override
  final BuiltList<EventModel> events;
  @override
  final Paginator postsPaginator;
  @override
  final bool initialized;

  factory _$VendorState([void Function(VendorStateBuilder)? updates]) =>
      (new VendorStateBuilder()..update(updates))._build();

  _$VendorState._(
      {this.error,
      required this.isLoading,
      required this.success,
      required this.vendor,
      required this.products,
      required this.projects,
      required this.services,
      required this.shares,
      required this.events,
      required this.postsPaginator,
      required this.initialized})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'VendorState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(success, r'VendorState', 'success');
    BuiltValueNullFieldError.checkNotNull(vendor, r'VendorState', 'vendor');
    BuiltValueNullFieldError.checkNotNull(products, r'VendorState', 'products');
    BuiltValueNullFieldError.checkNotNull(projects, r'VendorState', 'projects');
    BuiltValueNullFieldError.checkNotNull(services, r'VendorState', 'services');
    BuiltValueNullFieldError.checkNotNull(shares, r'VendorState', 'shares');
    BuiltValueNullFieldError.checkNotNull(events, r'VendorState', 'events');
    BuiltValueNullFieldError.checkNotNull(
        postsPaginator, r'VendorState', 'postsPaginator');
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'VendorState', 'initialized');
  }

  @override
  VendorState rebuild(void Function(VendorStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VendorStateBuilder toBuilder() => new VendorStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VendorState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        vendor == other.vendor &&
        products == other.products &&
        projects == other.projects &&
        services == other.services &&
        shares == other.shares &&
        events == other.events &&
        postsPaginator == other.postsPaginator &&
        initialized == other.initialized;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, vendor.hashCode);
    _$hash = $jc(_$hash, products.hashCode);
    _$hash = $jc(_$hash, projects.hashCode);
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jc(_$hash, shares.hashCode);
    _$hash = $jc(_$hash, events.hashCode);
    _$hash = $jc(_$hash, postsPaginator.hashCode);
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VendorState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('vendor', vendor)
          ..add('products', products)
          ..add('projects', projects)
          ..add('services', services)
          ..add('shares', shares)
          ..add('events', events)
          ..add('postsPaginator', postsPaginator)
          ..add('initialized', initialized))
        .toString();
  }
}

class VendorStateBuilder implements Builder<VendorState, VendorStateBuilder> {
  _$VendorState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  UserModelBuilder? _vendor;
  UserModelBuilder get vendor => _$this._vendor ??= new UserModelBuilder();
  set vendor(UserModelBuilder? vendor) => _$this._vendor = vendor;

  ListBuilder<ProductModel>? _products;
  ListBuilder<ProductModel> get products =>
      _$this._products ??= new ListBuilder<ProductModel>();
  set products(ListBuilder<ProductModel>? products) =>
      _$this._products = products;

  ListBuilder<ProjectModel>? _projects;
  ListBuilder<ProjectModel> get projects =>
      _$this._projects ??= new ListBuilder<ProjectModel>();
  set projects(ListBuilder<ProjectModel>? projects) =>
      _$this._projects = projects;

  ListBuilder<ServiceModel>? _services;
  ListBuilder<ServiceModel> get services =>
      _$this._services ??= new ListBuilder<ServiceModel>();
  set services(ListBuilder<ServiceModel>? services) =>
      _$this._services = services;

  ListBuilder<ShareModel>? _shares;
  ListBuilder<ShareModel> get shares =>
      _$this._shares ??= new ListBuilder<ShareModel>();
  set shares(ListBuilder<ShareModel>? shares) => _$this._shares = shares;

  ListBuilder<EventModel>? _events;
  ListBuilder<EventModel> get events =>
      _$this._events ??= new ListBuilder<EventModel>();
  set events(ListBuilder<EventModel>? events) => _$this._events = events;

  PaginatorBuilder? _postsPaginator;
  PaginatorBuilder get postsPaginator =>
      _$this._postsPaginator ??= new PaginatorBuilder();
  set postsPaginator(PaginatorBuilder? postsPaginator) =>
      _$this._postsPaginator = postsPaginator;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  VendorStateBuilder();

  VendorStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _vendor = $v.vendor.toBuilder();
      _products = $v.products.toBuilder();
      _projects = $v.projects.toBuilder();
      _services = $v.services.toBuilder();
      _shares = $v.shares.toBuilder();
      _events = $v.events.toBuilder();
      _postsPaginator = $v.postsPaginator.toBuilder();
      _initialized = $v.initialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VendorState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VendorState;
  }

  @override
  void update(void Function(VendorStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VendorState build() => _build();

  _$VendorState _build() {
    _$VendorState _$result;
    try {
      _$result = _$v ??
          new _$VendorState._(
              error: error,
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'VendorState', 'isLoading'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'VendorState', 'success'),
              vendor: vendor.build(),
              products: products.build(),
              projects: projects.build(),
              services: services.build(),
              shares: shares.build(),
              events: events.build(),
              postsPaginator: postsPaginator.build(),
              initialized: BuiltValueNullFieldError.checkNotNull(
                  initialized, r'VendorState', 'initialized'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vendor';
        vendor.build();
        _$failedField = 'products';
        products.build();
        _$failedField = 'projects';
        projects.build();
        _$failedField = 'services';
        services.build();
        _$failedField = 'shares';
        shares.build();
        _$failedField = 'events';
        events.build();
        _$failedField = 'postsPaginator';
        postsPaginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VendorState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
