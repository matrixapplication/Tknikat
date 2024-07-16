// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_services_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MyServicesState extends MyServicesState {
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
  final BaseResponse<BuiltList<ServiceModel>> myServices;
  @override
  final Paginator paginator;
  @override
  final bool initialized;

  factory _$MyServicesState([void Function(MyServicesStateBuilder)? updates]) =>
      (new MyServicesStateBuilder()..update(updates))._build();

  _$MyServicesState._(
      {required this.isLoading,
      required this.addSuccess,
      required this.editSuccess,
      required this.removeSuccess,
      this.error,
      required this.myServices,
      required this.paginator,
      required this.initialized})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'MyServicesState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        addSuccess, r'MyServicesState', 'addSuccess');
    BuiltValueNullFieldError.checkNotNull(
        editSuccess, r'MyServicesState', 'editSuccess');
    BuiltValueNullFieldError.checkNotNull(
        removeSuccess, r'MyServicesState', 'removeSuccess');
    BuiltValueNullFieldError.checkNotNull(
        myServices, r'MyServicesState', 'myServices');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'MyServicesState', 'paginator');
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'MyServicesState', 'initialized');
  }

  @override
  MyServicesState rebuild(void Function(MyServicesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyServicesStateBuilder toBuilder() =>
      new MyServicesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyServicesState &&
        isLoading == other.isLoading &&
        addSuccess == other.addSuccess &&
        editSuccess == other.editSuccess &&
        removeSuccess == other.removeSuccess &&
        error == other.error &&
        myServices == other.myServices &&
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
    _$hash = $jc(_$hash, myServices.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyServicesState')
          ..add('isLoading', isLoading)
          ..add('addSuccess', addSuccess)
          ..add('editSuccess', editSuccess)
          ..add('removeSuccess', removeSuccess)
          ..add('error', error)
          ..add('myServices', myServices)
          ..add('paginator', paginator)
          ..add('initialized', initialized))
        .toString();
  }
}

class MyServicesStateBuilder
    implements Builder<MyServicesState, MyServicesStateBuilder> {
  _$MyServicesState? _$v;

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

  BaseResponseBuilder<BuiltList<ServiceModel>>? _myServices;
  BaseResponseBuilder<BuiltList<ServiceModel>> get myServices =>
      _$this._myServices ??= new BaseResponseBuilder<BuiltList<ServiceModel>>();
  set myServices(BaseResponseBuilder<BuiltList<ServiceModel>>? myServices) =>
      _$this._myServices = myServices;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  MyServicesStateBuilder();

  MyServicesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _addSuccess = $v.addSuccess;
      _editSuccess = $v.editSuccess;
      _removeSuccess = $v.removeSuccess;
      _error = $v.error;
      _myServices = $v.myServices.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _initialized = $v.initialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyServicesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyServicesState;
  }

  @override
  void update(void Function(MyServicesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyServicesState build() => _build();

  _$MyServicesState _build() {
    _$MyServicesState _$result;
    try {
      _$result = _$v ??
          new _$MyServicesState._(
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'MyServicesState', 'isLoading'),
              addSuccess: BuiltValueNullFieldError.checkNotNull(
                  addSuccess, r'MyServicesState', 'addSuccess'),
              editSuccess: BuiltValueNullFieldError.checkNotNull(
                  editSuccess, r'MyServicesState', 'editSuccess'),
              removeSuccess: BuiltValueNullFieldError.checkNotNull(
                  removeSuccess, r'MyServicesState', 'removeSuccess'),
              error: error,
              myServices: myServices.build(),
              paginator: paginator.build(),
              initialized: BuiltValueNullFieldError.checkNotNull(
                  initialized, r'MyServicesState', 'initialized'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'myServices';
        myServices.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MyServicesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
