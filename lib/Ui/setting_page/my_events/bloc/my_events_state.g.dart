// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_events_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MyEventsState extends MyEventsState {
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
  final BuiltList<EventModel> myEvents;
  @override
  final Paginator paginator;
  @override
  final bool initialized;

  factory _$MyEventsState([void Function(MyEventsStateBuilder)? updates]) =>
      (new MyEventsStateBuilder()..update(updates))._build();

  _$MyEventsState._(
      {required this.isLoading,
      required this.addSuccess,
      required this.editSuccess,
      required this.removeSuccess,
      this.error,
      required this.myEvents,
      required this.paginator,
      required this.initialized})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'MyEventsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        addSuccess, r'MyEventsState', 'addSuccess');
    BuiltValueNullFieldError.checkNotNull(
        editSuccess, r'MyEventsState', 'editSuccess');
    BuiltValueNullFieldError.checkNotNull(
        removeSuccess, r'MyEventsState', 'removeSuccess');
    BuiltValueNullFieldError.checkNotNull(
        myEvents, r'MyEventsState', 'myEvents');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'MyEventsState', 'paginator');
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'MyEventsState', 'initialized');
  }

  @override
  MyEventsState rebuild(void Function(MyEventsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MyEventsStateBuilder toBuilder() => new MyEventsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MyEventsState &&
        isLoading == other.isLoading &&
        addSuccess == other.addSuccess &&
        editSuccess == other.editSuccess &&
        removeSuccess == other.removeSuccess &&
        error == other.error &&
        myEvents == other.myEvents &&
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
    _$hash = $jc(_$hash, myEvents.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MyEventsState')
          ..add('isLoading', isLoading)
          ..add('addSuccess', addSuccess)
          ..add('editSuccess', editSuccess)
          ..add('removeSuccess', removeSuccess)
          ..add('error', error)
          ..add('myEvents', myEvents)
          ..add('paginator', paginator)
          ..add('initialized', initialized))
        .toString();
  }
}

class MyEventsStateBuilder
    implements Builder<MyEventsState, MyEventsStateBuilder> {
  _$MyEventsState? _$v;

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

  ListBuilder<EventModel>? _myEvents;
  ListBuilder<EventModel> get myEvents =>
      _$this._myEvents ??= new ListBuilder<EventModel>();
  set myEvents(ListBuilder<EventModel>? myEvents) =>
      _$this._myEvents = myEvents;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  MyEventsStateBuilder();

  MyEventsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _addSuccess = $v.addSuccess;
      _editSuccess = $v.editSuccess;
      _removeSuccess = $v.removeSuccess;
      _error = $v.error;
      _myEvents = $v.myEvents.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _initialized = $v.initialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MyEventsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MyEventsState;
  }

  @override
  void update(void Function(MyEventsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MyEventsState build() => _build();

  _$MyEventsState _build() {
    _$MyEventsState _$result;
    try {
      _$result = _$v ??
          new _$MyEventsState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'MyEventsState', 'isLoading'),
            addSuccess: BuiltValueNullFieldError.checkNotNull(
                addSuccess, r'MyEventsState', 'addSuccess'),
            editSuccess: BuiltValueNullFieldError.checkNotNull(
                editSuccess, r'MyEventsState', 'editSuccess'),
            removeSuccess: BuiltValueNullFieldError.checkNotNull(
                removeSuccess, r'MyEventsState', 'removeSuccess'),
            error: error,
            myEvents: myEvents.build(),
            paginator: paginator.build(),
            initialized: BuiltValueNullFieldError.checkNotNull(
                initialized, r'MyEventsState', 'initialized'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'myEvents';
        myEvents.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MyEventsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
