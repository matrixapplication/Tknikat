// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retails_event.dart';

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

class _$GetCategoryRetails extends GetCategoryRetails {
  @override
  final int categoryId;

  factory _$GetCategoryRetails(
          [void Function(GetCategoryRetailsBuilder)? updates]) =>
      (new GetCategoryRetailsBuilder()..update(updates))._build();

  _$GetCategoryRetails._({required this.categoryId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'GetCategoryRetails', 'categoryId');
  }

  @override
  GetCategoryRetails rebuild(
          void Function(GetCategoryRetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCategoryRetailsBuilder toBuilder() =>
      new GetCategoryRetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCategoryRetails && categoryId == other.categoryId;
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
    return (newBuiltValueToStringHelper(r'GetCategoryRetails')
          ..add('categoryId', categoryId))
        .toString();
  }
}

class GetCategoryRetailsBuilder
    implements Builder<GetCategoryRetails, GetCategoryRetailsBuilder> {
  _$GetCategoryRetails? _$v;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  GetCategoryRetailsBuilder();

  GetCategoryRetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryId = $v.categoryId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetCategoryRetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetCategoryRetails;
  }

  @override
  void update(void Function(GetCategoryRetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCategoryRetails build() => _build();

  _$GetCategoryRetails _build() {
    final _$result = _$v ??
        new _$GetCategoryRetails._(
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'GetCategoryRetails', 'categoryId'));
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

class _$GetCart extends GetCart {
  factory _$GetCart([void Function(GetCartBuilder)? updates]) =>
      (new GetCartBuilder()..update(updates))._build();

  _$GetCart._() : super._();

  @override
  GetCart rebuild(void Function(GetCartBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCartBuilder toBuilder() => new GetCartBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCart;
  }

  @override
  int get hashCode {
    return 568568819;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetCart').toString();
  }
}

class GetCartBuilder implements Builder<GetCart, GetCartBuilder> {
  _$GetCart? _$v;

  GetCartBuilder();

  @override
  void replace(GetCart other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetCart;
  }

  @override
  void update(void Function(GetCartBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCart build() => _build();

  _$GetCart _build() {
    final _$result = _$v ?? new _$GetCart._();
    replace(_$result);
    return _$result;
  }
}

class _$SearchRetails extends SearchRetails {
  @override
  final int categoryId;
  @override
  final String search;

  factory _$SearchRetails([void Function(SearchRetailsBuilder)? updates]) =>
      (new SearchRetailsBuilder()..update(updates))._build();

  _$SearchRetails._({required this.categoryId, required this.search})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        categoryId, r'SearchRetails', 'categoryId');
    BuiltValueNullFieldError.checkNotNull(search, r'SearchRetails', 'search');
  }

  @override
  SearchRetails rebuild(void Function(SearchRetailsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchRetailsBuilder toBuilder() => new SearchRetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchRetails &&
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
    return (newBuiltValueToStringHelper(r'SearchRetails')
          ..add('categoryId', categoryId)
          ..add('search', search))
        .toString();
  }
}

class SearchRetailsBuilder
    implements Builder<SearchRetails, SearchRetailsBuilder> {
  _$SearchRetails? _$v;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  String? _search;
  String? get search => _$this._search;
  set search(String? search) => _$this._search = search;

  SearchRetailsBuilder();

  SearchRetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryId = $v.categoryId;
      _search = $v.search;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchRetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchRetails;
  }

  @override
  void update(void Function(SearchRetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SearchRetails build() => _build();

  _$SearchRetails _build() {
    final _$result = _$v ??
        new _$SearchRetails._(
            categoryId: BuiltValueNullFieldError.checkNotNull(
                categoryId, r'SearchRetails', 'categoryId'),
            search: BuiltValueNullFieldError.checkNotNull(
                search, r'SearchRetails', 'search'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
