// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_services_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AllServicesState extends AllServicesState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final BuiltList<ServiceModel> services;
  @override
  final Paginator paginator;

  factory _$AllServicesState(
          [void Function(AllServicesStateBuilder)? updates]) =>
      (new AllServicesStateBuilder()..update(updates))._build();

  _$AllServicesState._(
      {this.error,
      required this.isLoading,
      required this.services,
      required this.paginator})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'AllServicesState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        services, r'AllServicesState', 'services');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'AllServicesState', 'paginator');
  }

  @override
  AllServicesState rebuild(void Function(AllServicesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllServicesStateBuilder toBuilder() =>
      new AllServicesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllServicesState &&
        error == other.error &&
        isLoading == other.isLoading &&
        services == other.services &&
        paginator == other.paginator;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, services.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AllServicesState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('services', services)
          ..add('paginator', paginator))
        .toString();
  }
}

class AllServicesStateBuilder
    implements Builder<AllServicesState, AllServicesStateBuilder> {
  _$AllServicesState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  ListBuilder<ServiceModel>? _services;
  ListBuilder<ServiceModel> get services =>
      _$this._services ??= new ListBuilder<ServiceModel>();
  set services(ListBuilder<ServiceModel>? services) =>
      _$this._services = services;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  AllServicesStateBuilder();

  AllServicesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _services = $v.services.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllServicesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllServicesState;
  }

  @override
  void update(void Function(AllServicesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllServicesState build() => _build();

  _$AllServicesState _build() {
    _$AllServicesState _$result;
    try {
      _$result = _$v ??
          new _$AllServicesState._(
              error: error,
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'AllServicesState', 'isLoading'),
              services: services.build(),
              paginator: paginator.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'services';
        services.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllServicesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
