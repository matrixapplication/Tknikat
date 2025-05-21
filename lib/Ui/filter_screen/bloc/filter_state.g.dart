// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FilterState extends FilterState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final List<CategoryModel> categories;
  @override
  final List<Country> countries;

  factory _$FilterState([void Function(FilterStateBuilder)? updates]) =>
      (new FilterStateBuilder()..update(updates))._build();

  _$FilterState._(
      {this.error,
      required this.isLoading,
      required this.categories,
      required this.countries})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'FilterState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        categories, r'FilterState', 'categories');
    BuiltValueNullFieldError.checkNotNull(
        countries, r'FilterState', 'countries');
  }

  @override
  FilterState rebuild(void Function(FilterStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilterStateBuilder toBuilder() => new FilterStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilterState &&
        error == other.error &&
        isLoading == other.isLoading &&
        categories == other.categories &&
        countries == other.countries;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, categories.hashCode);
    _$hash = $jc(_$hash, countries.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilterState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('categories', categories)
          ..add('countries', countries))
        .toString();
  }
}

class FilterStateBuilder implements Builder<FilterState, FilterStateBuilder> {
  _$FilterState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  List<CategoryModel>? _categories;
  List<CategoryModel>? get categories => _$this._categories;
  set categories(List<CategoryModel>? categories) =>
      _$this._categories = categories;

  List<Country>? _countries;
  List<Country>? get countries => _$this._countries;
  set countries(List<Country>? countries) => _$this._countries = countries;

  FilterStateBuilder();

  FilterStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _categories = $v.categories;
      _countries = $v.countries;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilterState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilterState;
  }

  @override
  void update(void Function(FilterStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilterState build() => _build();

  _$FilterState _build() {
    final _$result = _$v ??
        new _$FilterState._(
          error: error,
          isLoading: BuiltValueNullFieldError.checkNotNull(
              isLoading, r'FilterState', 'isLoading'),
          categories: BuiltValueNullFieldError.checkNotNull(
              categories, r'FilterState', 'categories'),
          countries: BuiltValueNullFieldError.checkNotNull(
              countries, r'FilterState', 'countries'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
