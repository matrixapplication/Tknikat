// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_content_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ServiceContentState extends ServiceContentState {
  @override
  final String? error;
  @override
  final bool success;
  @override
  final bool isLoading;
  @override
  final BuiltList<CommentModel> comments;
  @override
  final Paginator paginator;

  factory _$ServiceContentState(
          [void Function(ServiceContentStateBuilder)? updates]) =>
      (new ServiceContentStateBuilder()..update(updates))._build();

  _$ServiceContentState._(
      {this.error,
      required this.success,
      required this.isLoading,
      required this.comments,
      required this.paginator})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'ServiceContentState', 'success');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'ServiceContentState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        comments, r'ServiceContentState', 'comments');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'ServiceContentState', 'paginator');
  }

  @override
  ServiceContentState rebuild(
          void Function(ServiceContentStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceContentStateBuilder toBuilder() =>
      new ServiceContentStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceContentState &&
        error == other.error &&
        success == other.success &&
        isLoading == other.isLoading &&
        comments == other.comments &&
        paginator == other.paginator;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ServiceContentState')
          ..add('error', error)
          ..add('success', success)
          ..add('isLoading', isLoading)
          ..add('comments', comments)
          ..add('paginator', paginator))
        .toString();
  }
}

class ServiceContentStateBuilder
    implements Builder<ServiceContentState, ServiceContentStateBuilder> {
  _$ServiceContentState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  ListBuilder<CommentModel>? _comments;
  ListBuilder<CommentModel> get comments =>
      _$this._comments ??= new ListBuilder<CommentModel>();
  set comments(ListBuilder<CommentModel>? comments) =>
      _$this._comments = comments;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  ServiceContentStateBuilder();

  ServiceContentStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _success = $v.success;
      _isLoading = $v.isLoading;
      _comments = $v.comments.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceContentState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ServiceContentState;
  }

  @override
  void update(void Function(ServiceContentStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ServiceContentState build() => _build();

  _$ServiceContentState _build() {
    _$ServiceContentState _$result;
    try {
      _$result = _$v ??
          new _$ServiceContentState._(
              error: error,
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'ServiceContentState', 'success'),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'ServiceContentState', 'isLoading'),
              comments: comments.build(),
              paginator: paginator.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comments';
        comments.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ServiceContentState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
