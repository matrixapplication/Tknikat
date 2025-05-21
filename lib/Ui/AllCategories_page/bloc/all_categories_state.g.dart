// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_categories_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AllCategoriesState extends AllCategoriesState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final bool success;
  @override
  final bool initialized;
  @override
  final BuiltList<CategoryModel> servicesCategories;
  @override
  final BuiltList<CategoryModel> productsCategories;
  @override
  final BuiltList<CategoryModel> projectsCategories;
  @override
  final BuiltList<EventModel> projectsEvents;

  factory _$AllCategoriesState(
          [void Function(AllCategoriesStateBuilder)? updates]) =>
      (new AllCategoriesStateBuilder()..update(updates))._build();

  _$AllCategoriesState._(
      {this.error,
      required this.isLoading,
      required this.success,
      required this.initialized,
      required this.servicesCategories,
      required this.productsCategories,
      required this.projectsCategories,
      required this.projectsEvents})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'AllCategoriesState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        success, r'AllCategoriesState', 'success');
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'AllCategoriesState', 'initialized');
    BuiltValueNullFieldError.checkNotNull(
        servicesCategories, r'AllCategoriesState', 'servicesCategories');
    BuiltValueNullFieldError.checkNotNull(
        productsCategories, r'AllCategoriesState', 'productsCategories');
    BuiltValueNullFieldError.checkNotNull(
        projectsCategories, r'AllCategoriesState', 'projectsCategories');
    BuiltValueNullFieldError.checkNotNull(
        projectsEvents, r'AllCategoriesState', 'projectsEvents');
  }

  @override
  AllCategoriesState rebuild(
          void Function(AllCategoriesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllCategoriesStateBuilder toBuilder() =>
      new AllCategoriesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllCategoriesState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        initialized == other.initialized &&
        servicesCategories == other.servicesCategories &&
        productsCategories == other.productsCategories &&
        projectsCategories == other.projectsCategories &&
        projectsEvents == other.projectsEvents;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jc(_$hash, servicesCategories.hashCode);
    _$hash = $jc(_$hash, productsCategories.hashCode);
    _$hash = $jc(_$hash, projectsCategories.hashCode);
    _$hash = $jc(_$hash, projectsEvents.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AllCategoriesState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('initialized', initialized)
          ..add('servicesCategories', servicesCategories)
          ..add('productsCategories', productsCategories)
          ..add('projectsCategories', projectsCategories)
          ..add('projectsEvents', projectsEvents))
        .toString();
  }
}

class AllCategoriesStateBuilder
    implements Builder<AllCategoriesState, AllCategoriesStateBuilder> {
  _$AllCategoriesState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  ListBuilder<CategoryModel>? _servicesCategories;
  ListBuilder<CategoryModel> get servicesCategories =>
      _$this._servicesCategories ??= new ListBuilder<CategoryModel>();
  set servicesCategories(ListBuilder<CategoryModel>? servicesCategories) =>
      _$this._servicesCategories = servicesCategories;

  ListBuilder<CategoryModel>? _productsCategories;
  ListBuilder<CategoryModel> get productsCategories =>
      _$this._productsCategories ??= new ListBuilder<CategoryModel>();
  set productsCategories(ListBuilder<CategoryModel>? productsCategories) =>
      _$this._productsCategories = productsCategories;

  ListBuilder<CategoryModel>? _projectsCategories;
  ListBuilder<CategoryModel> get projectsCategories =>
      _$this._projectsCategories ??= new ListBuilder<CategoryModel>();
  set projectsCategories(ListBuilder<CategoryModel>? projectsCategories) =>
      _$this._projectsCategories = projectsCategories;

  ListBuilder<EventModel>? _projectsEvents;
  ListBuilder<EventModel> get projectsEvents =>
      _$this._projectsEvents ??= new ListBuilder<EventModel>();
  set projectsEvents(ListBuilder<EventModel>? projectsEvents) =>
      _$this._projectsEvents = projectsEvents;

  AllCategoriesStateBuilder();

  AllCategoriesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _initialized = $v.initialized;
      _servicesCategories = $v.servicesCategories.toBuilder();
      _productsCategories = $v.productsCategories.toBuilder();
      _projectsCategories = $v.projectsCategories.toBuilder();
      _projectsEvents = $v.projectsEvents.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllCategoriesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllCategoriesState;
  }

  @override
  void update(void Function(AllCategoriesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllCategoriesState build() => _build();

  _$AllCategoriesState _build() {
    _$AllCategoriesState _$result;
    try {
      _$result = _$v ??
          new _$AllCategoriesState._(
            error: error,
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'AllCategoriesState', 'isLoading'),
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'AllCategoriesState', 'success'),
            initialized: BuiltValueNullFieldError.checkNotNull(
                initialized, r'AllCategoriesState', 'initialized'),
            servicesCategories: servicesCategories.build(),
            productsCategories: productsCategories.build(),
            projectsCategories: projectsCategories.build(),
            projectsEvents: projectsEvents.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'servicesCategories';
        servicesCategories.build();
        _$failedField = 'productsCategories';
        productsCategories.build();
        _$failedField = 'projectsCategories';
        projectsCategories.build();
        _$failedField = 'projectsEvents';
        projectsEvents.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllCategoriesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
