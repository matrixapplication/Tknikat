// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_projects_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MyProjectsState extends MyProjectsState {
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
  final BuiltList<ProjectModel> myProjects;
  @override
  final Paginator paginator;
  @override
  final bool initialized;

  factory _$MyProjectsState([void Function(MyProjectsStateBuilder)? updates]) =>
      (new MyProjectsStateBuilder()..update(updates))._build();

  _$MyProjectsState._(
      {required this.isLoading,
      required this.addSuccess,
      required this.editSuccess,
      required this.removeSuccess,
      this.error,
      required this.myProjects,
      required this.paginator,
      required this.initialized})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'MyProjectsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        addSuccess, r'MyProjectsState', 'addSuccess');
    BuiltValueNullFieldError.checkNotNull(
        editSuccess, r'MyProjectsState', 'editSuccess');
    BuiltValueNullFieldError.checkNotNull(
        removeSuccess, r'MyProjectsState', 'removeSuccess');
    BuiltValueNullFieldError.checkNotNull(
        myProjects, r'MyProjectsState', 'myProjects');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'MyProjectsState', 'paginator');
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'MyProjectsState', 'initialized');
  }

  @override
  MyProjectsState rebuild(void Function(MyProjectsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyProjectsStateBuilder toBuilder() =>
      new MyProjectsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyProjectsState &&
        isLoading == other.isLoading &&
        addSuccess == other.addSuccess &&
        editSuccess == other.editSuccess &&
        removeSuccess == other.removeSuccess &&
        error == other.error &&
        myProjects == other.myProjects &&
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
    _$hash = $jc(_$hash, myProjects.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyProjectsState')
          ..add('isLoading', isLoading)
          ..add('addSuccess', addSuccess)
          ..add('editSuccess', editSuccess)
          ..add('removeSuccess', removeSuccess)
          ..add('error', error)
          ..add('myProjects', myProjects)
          ..add('paginator', paginator)
          ..add('initialized', initialized))
        .toString();
  }
}

class MyProjectsStateBuilder
    implements Builder<MyProjectsState, MyProjectsStateBuilder> {
  _$MyProjectsState? _$v;

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

  ListBuilder<ProjectModel>? _myProjects;
  ListBuilder<ProjectModel> get myProjects =>
      _$this._myProjects ??= new ListBuilder<ProjectModel>();
  set myProjects(ListBuilder<ProjectModel>? myProjects) =>
      _$this._myProjects = myProjects;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  MyProjectsStateBuilder();

  MyProjectsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _addSuccess = $v.addSuccess;
      _editSuccess = $v.editSuccess;
      _removeSuccess = $v.removeSuccess;
      _error = $v.error;
      _myProjects = $v.myProjects.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _initialized = $v.initialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyProjectsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyProjectsState;
  }

  @override
  void update(void Function(MyProjectsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyProjectsState build() => _build();

  _$MyProjectsState _build() {
    _$MyProjectsState _$result;
    try {
      _$result = _$v ??
          new _$MyProjectsState._(
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'MyProjectsState', 'isLoading'),
              addSuccess: BuiltValueNullFieldError.checkNotNull(
                  addSuccess, r'MyProjectsState', 'addSuccess'),
              editSuccess: BuiltValueNullFieldError.checkNotNull(
                  editSuccess, r'MyProjectsState', 'editSuccess'),
              removeSuccess: BuiltValueNullFieldError.checkNotNull(
                  removeSuccess, r'MyProjectsState', 'removeSuccess'),
              error: error,
              myProjects: myProjects.build(),
              paginator: paginator.build(),
              initialized: BuiltValueNullFieldError.checkNotNull(
                  initialized, r'MyProjectsState', 'initialized'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'myProjects';
        myProjects.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MyProjectsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
