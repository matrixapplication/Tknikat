// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClearError extends ClearError {
  factory _$ClearError([void Function(ClearErrorBuilder)? updates]) =>
      (new ClearErrorBuilder()..update(updates))._build();

  _$ClearError._() : super._();

  @override
  ClearError rebuild(void Function(ClearErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearErrorBuilder toBuilder() => new ClearErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearError;
  }

  @override
  int get hashCode {
    return 507656265;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearError').toString();
  }
}

class ClearErrorBuilder implements Builder<ClearError, ClearErrorBuilder> {
  _$ClearError? _$v;

  ClearErrorBuilder();

  @override
  void replace(ClearError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearError;
  }

  @override
  void update(void Function(ClearErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearError build() => _build();

  _$ClearError _build() {
    final _$result = _$v ?? new _$ClearError._();
    replace(_$result);
    return _$result;
  }
}

class _$GetCategoryServices extends GetCategoryServices {
  @override
  final int categoryId;

  factory _$GetCategoryServices(
          [void Function(GetCategoryServicesBuilder)? updates]) =>
      (new GetCategoryServicesBuilder()..update(updates))._build();

  _$GetCategoryServices._({required this.categoryId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'GetCategoryServices', 'categoryId');
  }

  @override
  GetCategoryServices rebuild(
          void Function(GetCategoryServicesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCategoryServicesBuilder toBuilder() =>
      new GetCategoryServicesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCategoryServices && categoryId == other.categoryId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetCategoryServices')
          ..add('categoryId', categoryId))
        .toString();
  }
}

class GetCategoryServicesBuilder
    implements Builder<GetCategoryServices, GetCategoryServicesBuilder> {
  _$GetCategoryServices? _$v;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  GetCategoryServicesBuilder();

  GetCategoryServicesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryId = $v.categoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetCategoryServices other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetCategoryServices;
  }

  @override
  void update(void Function(GetCategoryServicesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCategoryServices build() => _build();

  _$GetCategoryServices _build() {
    final _$result = _$v ??
        new _$GetCategoryServices._(
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'GetCategoryServices', 'categoryId'));
    replace(_$result);
    return _$result;
  }
}

class _$GetNext extends GetNext {
  @override
  final int categoryId;

  factory _$GetNext([void Function(GetNextBuilder)? updates]) =>
      (new GetNextBuilder()..update(updates))._build();

  _$GetNext._({required this.categoryId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(categoryId, r'GetNext', 'categoryId');
  }

  @override
  GetNext rebuild(void Function(GetNextBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNextBuilder toBuilder() => new GetNextBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNext && categoryId == other.categoryId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetNext')
          ..add('categoryId', categoryId))
        .toString();
  }
}

class GetNextBuilder implements Builder<GetNext, GetNextBuilder> {
  _$GetNext? _$v;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  GetNextBuilder();

  GetNextBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryId = $v.categoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetNext other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNext;
  }

  @override
  void update(void Function(GetNextBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNext build() => _build();

  _$GetNext _build() {
    final _$result = _$v ??
        new _$GetNext._(
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'GetNext', 'categoryId'));
    replace(_$result);
    return _$result;
  }
}

class _$GetAllCategories extends GetAllCategories {
  @override
  final String type;

  factory _$GetAllCategories(
          [void Function(GetAllCategoriesBuilder)? updates]) =>
      (new GetAllCategoriesBuilder()..update(updates))._build();

  _$GetAllCategories._({required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'GetAllCategories', 'type');
  }

  @override
  GetAllCategories rebuild(void Function(GetAllCategoriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAllCategoriesBuilder toBuilder() =>
      new GetAllCategoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAllCategories && type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetAllCategories')..add('type', type))
        .toString();
  }
}

class GetAllCategoriesBuilder
    implements Builder<GetAllCategories, GetAllCategoriesBuilder> {
  _$GetAllCategories? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  GetAllCategoriesBuilder();

  GetAllCategoriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAllCategories other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetAllCategories;
  }

  @override
  void update(void Function(GetAllCategoriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAllCategories build() => _build();

  _$GetAllCategories _build() {
    final _$result = _$v ??
        new _$GetAllCategories._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'GetAllCategories', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$ChangeState extends ChangeState {
  factory _$ChangeState([void Function(ChangeStateBuilder)? updates]) =>
      (new ChangeStateBuilder()..update(updates))._build();

  _$ChangeState._() : super._();

  @override
  ChangeState rebuild(void Function(ChangeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChangeStateBuilder toBuilder() => new ChangeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChangeState;
  }

  @override
  int get hashCode {
    return 404821806;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ChangeState').toString();
  }
}

class ChangeStateBuilder implements Builder<ChangeState, ChangeStateBuilder> {
  _$ChangeState? _$v;

  ChangeStateBuilder();

  @override
  void replace(ChangeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChangeState;
  }

  @override
  void update(void Function(ChangeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChangeState build() => _build();

  _$ChangeState _build() {
    final _$result = _$v ?? new _$ChangeState._();
    replace(_$result);
    return _$result;
  }
}

class _$GetDayShifts extends GetDayShifts {
  @override
  final int service_id;
  @override
  final DateTime date;

  factory _$GetDayShifts([void Function(GetDayShiftsBuilder)? updates]) =>
      (new GetDayShiftsBuilder()..update(updates))._build();

  _$GetDayShifts._({required this.service_id, required this.date}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        service_id, r'GetDayShifts', 'service_id');
    BuiltValueNullFieldError.checkNotNull(date, r'GetDayShifts', 'date');
  }

  @override
  GetDayShifts rebuild(void Function(GetDayShiftsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetDayShiftsBuilder toBuilder() => new GetDayShiftsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetDayShifts &&
        service_id == other.service_id &&
        date == other.date;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, service_id.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetDayShifts')
          ..add('service_id', service_id)
          ..add('date', date))
        .toString();
  }
}

class GetDayShiftsBuilder
    implements Builder<GetDayShifts, GetDayShiftsBuilder> {
  _$GetDayShifts? _$v;

  int? _service_id;
  int? get service_id => _$this._service_id;
  set service_id(int? service_id) => _$this._service_id = service_id;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  GetDayShiftsBuilder();

  GetDayShiftsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _service_id = $v.service_id;
      _date = $v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetDayShifts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetDayShifts;
  }

  @override
  void update(void Function(GetDayShiftsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetDayShifts build() => _build();

  _$GetDayShifts _build() {
    final _$result = _$v ??
        new _$GetDayShifts._(
            service_id: BuiltValueNullFieldError.checkNotNull(
                service_id, r'GetDayShifts', 'service_id'),
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'GetDayShifts', 'date'));
    replace(_$result);
    return _$result;
  }
}

class _$BookService extends BookService {
  @override
  final int service_id;
  @override
  final int store_shift_id;
  @override
  final DateTime date;

  factory _$BookService([void Function(BookServiceBuilder)? updates]) =>
      (new BookServiceBuilder()..update(updates))._build();

  _$BookService._(
      {required this.service_id,
      required this.store_shift_id,
      required this.date})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        service_id, r'BookService', 'service_id');
    BuiltValueNullFieldError.checkNotNull(
        store_shift_id, r'BookService', 'store_shift_id');
    BuiltValueNullFieldError.checkNotNull(date, r'BookService', 'date');
  }

  @override
  BookService rebuild(void Function(BookServiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookServiceBuilder toBuilder() => new BookServiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookService &&
        service_id == other.service_id &&
        store_shift_id == other.store_shift_id &&
        date == other.date;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, service_id.hashCode);
    _$hash = $jc(_$hash, store_shift_id.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookService')
          ..add('service_id', service_id)
          ..add('store_shift_id', store_shift_id)
          ..add('date', date))
        .toString();
  }
}

class BookServiceBuilder implements Builder<BookService, BookServiceBuilder> {
  _$BookService? _$v;

  int? _service_id;
  int? get service_id => _$this._service_id;
  set service_id(int? service_id) => _$this._service_id = service_id;

  int? _store_shift_id;
  int? get store_shift_id => _$this._store_shift_id;
  set store_shift_id(int? store_shift_id) =>
      _$this._store_shift_id = store_shift_id;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  BookServiceBuilder();

  BookServiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _service_id = $v.service_id;
      _store_shift_id = $v.store_shift_id;
      _date = $v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookService other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookService;
  }

  @override
  void update(void Function(BookServiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookService build() => _build();

  _$BookService _build() {
    final _$result = _$v ??
        new _$BookService._(
            service_id: BuiltValueNullFieldError.checkNotNull(
                service_id, r'BookService', 'service_id'),
            store_shift_id: BuiltValueNullFieldError.checkNotNull(
                store_shift_id, r'BookService', 'store_shift_id'),
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'BookService', 'date'));
    replace(_$result);
    return _$result;
  }
}

class _$SearchServices extends SearchServices {
  @override
  final int categoryId;
  @override
  final String search;

  factory _$SearchServices([void Function(SearchServicesBuilder)? updates]) =>
      (new SearchServicesBuilder()..update(updates))._build();

  _$SearchServices._({required this.categoryId, required this.search})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'SearchServices', 'categoryId');
    BuiltValueNullFieldError.checkNotNull(search, r'SearchServices', 'search');
  }

  @override
  SearchServices rebuild(void Function(SearchServicesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchServicesBuilder toBuilder() =>
      new SearchServicesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchServices &&
        categoryId == other.categoryId &&
        search == other.search;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, search.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SearchServices')
          ..add('categoryId', categoryId)
          ..add('search', search))
        .toString();
  }
}

class SearchServicesBuilder
    implements Builder<SearchServices, SearchServicesBuilder> {
  _$SearchServices? _$v;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  SearchServicesBuilder();

  SearchServicesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryId = $v.categoryId;
      _search = $v.search;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchServices other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchServices;
  }

  @override
  void update(void Function(SearchServicesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchServices build() => _build();

  _$SearchServices _build() {
    final _$result = _$v ??
        new _$SearchServices._(
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'SearchServices', 'categoryId'),
            search: BuiltValueNullFieldError.checkNotNull(
                search, r'SearchServices', 'search'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
