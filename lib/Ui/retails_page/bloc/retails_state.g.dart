// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retails_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RetailsState extends RetailsState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final BuiltList<ProductModel> retails;
  @override
  final Paginator paginator;

  factory _$RetailsState([void Function(RetailsStateBuilder)? updates]) =>
      (new RetailsStateBuilder()..update(updates))._build();

  _$RetailsState._(
      {this.error,
      required this.isLoading,
      required this.retails,
      required this.paginator})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'RetailsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(retails, r'RetailsState', 'retails');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'RetailsState', 'paginator');
  }

  @override
  RetailsState rebuild(void Function(RetailsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RetailsStateBuilder toBuilder() => new RetailsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RetailsState &&
        error == other.error &&
        isLoading == other.isLoading &&
        retails == other.retails &&
        paginator == other.paginator;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, retails.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RetailsState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('retails', retails)
          ..add('paginator', paginator))
        .toString();
  }
}

class RetailsStateBuilder
    implements Builder<RetailsState, RetailsStateBuilder> {
  _$RetailsState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  ListBuilder<ProductModel>? _retails;
  ListBuilder<ProductModel> get retails =>
      _$this._retails ??= new ListBuilder<ProductModel>();
  set retails(ListBuilder<ProductModel>? retails) => _$this._retails = retails;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  RetailsStateBuilder();

  RetailsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _retails = $v.retails.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RetailsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RetailsState;
  }

  @override
  void update(void Function(RetailsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RetailsState build() => _build();

  _$RetailsState _build() {
    _$RetailsState _$result;
    try {
      _$result = _$v ??
          new _$RetailsState._(
            error: error,
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'RetailsState', 'isLoading'),
            retails: retails.build(),
            paginator: paginator.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'retails';
        retails.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RetailsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
