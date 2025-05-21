// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ServicesState extends ServicesState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final BuiltList<ServiceModel> services;
  @override
  final Paginator paginator;

  factory _$ServicesState([void Function(ServicesStateBuilder)? updates]) =>
      (new ServicesStateBuilder()..update(updates))._build();

  _$ServicesState._(
      {this.error,
      required this.isLoading,
      required this.services,
      required this.paginator})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'ServicesState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        services, r'ServicesState', 'services');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'ServicesState', 'paginator');
  }

  @override
  ServicesState rebuild(void Function(ServicesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServicesStateBuilder toBuilder() => new ServicesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServicesState &&
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
    return (newBuiltValueToStringHelper(r'ServicesState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('services', services)
          ..add('paginator', paginator))
        .toString();
  }
}

class ServicesStateBuilder
    implements Builder<ServicesState, ServicesStateBuilder> {
  _$ServicesState? _$v;

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

  ServicesStateBuilder();

  ServicesStateBuilder get _$this {
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
  void replace(ServicesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServicesState;
  }

  @override
  void update(void Function(ServicesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServicesState build() => _build();

  _$ServicesState _build() {
    _$ServicesState _$result;
    try {
      _$result = _$v ??
          new _$ServicesState._(
            error: error,
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'ServicesState', 'isLoading'),
            services: services.build(),
            paginator: paginator.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'services';
        services.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServicesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
