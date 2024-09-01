// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_event.dart';

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

class _$GetFilterByCategory extends GetFilterByCategory {
  @override
  final int? categoryId;
  @override
  final bool? isServices;

  factory _$GetFilterByCategory(
          [void Function(GetFilterByCategoryBuilder)? updates]) =>
      (new GetFilterByCategoryBuilder()..update(updates))._build();

  _$GetFilterByCategory._({this.categoryId, this.isServices}) : super._();

  @override
  GetFilterByCategory rebuild(
          void Function(GetFilterByCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetFilterByCategoryBuilder toBuilder() =>
      new GetFilterByCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetFilterByCategory &&
        categoryId == other.categoryId &&
        isServices == other.isServices;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, isServices.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetFilterByCategory')
          ..add('categoryId', categoryId)
          ..add('isServices', isServices))
        .toString();
  }
}

class GetFilterByCategoryBuilder
    implements Builder<GetFilterByCategory, GetFilterByCategoryBuilder> {
  _$GetFilterByCategory? _$v;

  int? _categoryId;
  int? get categoryId => _$this._categoryId;
  set categoryId(int? categoryId) => _$this._categoryId = categoryId;

  bool? _isServices;
  bool? get isServices => _$this._isServices;
  set isServices(bool? isServices) => _$this._isServices = isServices;

  GetFilterByCategoryBuilder();

  GetFilterByCategoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _categoryId = $v.categoryId;
      _isServices = $v.isServices;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetFilterByCategory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetFilterByCategory;
  }

  @override
  void update(void Function(GetFilterByCategoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetFilterByCategory build() => _build();

  _$GetFilterByCategory _build() {
    final _$result = _$v ??
        new _$GetFilterByCategory._(
            categoryId: categoryId, isServices: isServices);
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
