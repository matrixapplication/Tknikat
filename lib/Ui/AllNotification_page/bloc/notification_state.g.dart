// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NotificationState extends NotificationState {
  @override
  final String error;
  @override
  final bool isLoading;
  @override
  final bool success;
  @override
  final bool initialized;
  @override
  final BuiltList<Notification> notifications;
  @override
  final Paginator paginator;
  @override
  final int unreadenNotificationCount;

  factory _$NotificationState(
          [void Function(NotificationStateBuilder)? updates]) =>
      (new NotificationStateBuilder()..update(updates))._build();

  _$NotificationState._(
      {required this.error,
      required this.isLoading,
      required this.success,
      required this.initialized,
      required this.notifications,
      required this.paginator,
      required this.unreadenNotificationCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(error, r'NotificationState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'NotificationState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        success, r'NotificationState', 'success');
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'NotificationState', 'initialized');
    BuiltValueNullFieldError.checkNotNull(
        notifications, r'NotificationState', 'notifications');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'NotificationState', 'paginator');
    BuiltValueNullFieldError.checkNotNull(unreadenNotificationCount,
        r'NotificationState', 'unreadenNotificationCount');
  }

  @override
  NotificationState rebuild(void Function(NotificationStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationStateBuilder toBuilder() =>
      new NotificationStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        initialized == other.initialized &&
        notifications == other.notifications &&
        paginator == other.paginator &&
        unreadenNotificationCount == other.unreadenNotificationCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jc(_$hash, notifications.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jc(_$hash, unreadenNotificationCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('initialized', initialized)
          ..add('notifications', notifications)
          ..add('paginator', paginator)
          ..add('unreadenNotificationCount', unreadenNotificationCount))
        .toString();
  }
}

class NotificationStateBuilder
    implements Builder<NotificationState, NotificationStateBuilder> {
  _$NotificationState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  ListBuilder<Notification>? _notifications;
  ListBuilder<Notification> get notifications =>
      _$this._notifications ??= new ListBuilder<Notification>();
  set notifications(ListBuilder<Notification>? notifications) =>
      _$this._notifications = notifications;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  int? _unreadenNotificationCount;
  int? get unreadenNotificationCount => _$this._unreadenNotificationCount;
  set unreadenNotificationCount(int? unreadenNotificationCount) =>
      _$this._unreadenNotificationCount = unreadenNotificationCount;

  NotificationStateBuilder();

  NotificationStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _initialized = $v.initialized;
      _notifications = $v.notifications.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _unreadenNotificationCount = $v.unreadenNotificationCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationState;
  }

  @override
  void update(void Function(NotificationStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationState build() => _build();

  _$NotificationState _build() {
    _$NotificationState _$result;
    try {
      _$result = _$v ??
          new _$NotificationState._(
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'NotificationState', 'error'),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'NotificationState', 'isLoading'),
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'NotificationState', 'success'),
            initialized: BuiltValueNullFieldError.checkNotNull(
                initialized, r'NotificationState', 'initialized'),
            notifications: notifications.build(),
            paginator: paginator.build(),
            unreadenNotificationCount: BuiltValueNullFieldError.checkNotNull(
                unreadenNotificationCount,
                r'NotificationState',
                'unreadenNotificationCount'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'notifications';
        notifications.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotificationState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
