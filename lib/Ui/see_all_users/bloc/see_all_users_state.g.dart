// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'see_all_users_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SeeAllUsersState extends SeeAllUsersState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final bool success;
  @override
  final BuiltList<UserModel> users;
  @override
  final Paginator paginator;

  factory _$SeeAllUsersState(
          [void Function(SeeAllUsersStateBuilder)? updates]) =>
      (new SeeAllUsersStateBuilder()..update(updates))._build();

  _$SeeAllUsersState._(
      {this.error,
      required this.isLoading,
      required this.success,
      required this.users,
      required this.paginator})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'SeeAllUsersState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        success, r'SeeAllUsersState', 'success');
    BuiltValueNullFieldError.checkNotNull(users, r'SeeAllUsersState', 'users');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'SeeAllUsersState', 'paginator');
  }

  @override
  SeeAllUsersState rebuild(void Function(SeeAllUsersStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SeeAllUsersStateBuilder toBuilder() =>
      new SeeAllUsersStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SeeAllUsersState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        users == other.users &&
        paginator == other.paginator;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SeeAllUsersState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('users', users)
          ..add('paginator', paginator))
        .toString();
  }
}

class SeeAllUsersStateBuilder
    implements Builder<SeeAllUsersState, SeeAllUsersStateBuilder> {
  _$SeeAllUsersState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<UserModel>? _users;
  ListBuilder<UserModel> get users =>
      _$this._users ??= new ListBuilder<UserModel>();
  set users(ListBuilder<UserModel>? users) => _$this._users = users;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  SeeAllUsersStateBuilder();

  SeeAllUsersStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _users = $v.users.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SeeAllUsersState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SeeAllUsersState;
  }

  @override
  void update(void Function(SeeAllUsersStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SeeAllUsersState build() => _build();

  _$SeeAllUsersState _build() {
    _$SeeAllUsersState _$result;
    try {
      _$result = _$v ??
          new _$SeeAllUsersState._(
            error: error,
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'SeeAllUsersState', 'isLoading'),
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'SeeAllUsersState', 'success'),
            users: users.build(),
            paginator: paginator.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SeeAllUsersState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
