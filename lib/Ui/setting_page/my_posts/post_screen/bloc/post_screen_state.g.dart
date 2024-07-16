// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_screen_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostScreenState extends PostScreenState {
  @override
  final String? error;
  @override
  final bool success;
  @override
  final BuiltList<CommentModel> comments;
  @override
  final Paginator paginator;
  @override
  final bool isLoading;

  factory _$PostScreenState([void Function(PostScreenStateBuilder)? updates]) =>
      (new PostScreenStateBuilder()..update(updates))._build();

  _$PostScreenState._(
      {this.error,
      required this.success,
      required this.comments,
      required this.paginator,
      required this.isLoading})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'PostScreenState', 'success');
    BuiltValueNullFieldError.checkNotNull(
        comments, r'PostScreenState', 'comments');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'PostScreenState', 'paginator');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'PostScreenState', 'isLoading');
  }

  @override
  PostScreenState rebuild(void Function(PostScreenStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostScreenStateBuilder toBuilder() =>
      new PostScreenStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostScreenState &&
        error == other.error &&
        success == other.success &&
        comments == other.comments &&
        paginator == other.paginator &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostScreenState')
          ..add('error', error)
          ..add('success', success)
          ..add('comments', comments)
          ..add('paginator', paginator)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class PostScreenStateBuilder
    implements Builder<PostScreenState, PostScreenStateBuilder> {
  _$PostScreenState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<CommentModel>? _comments;
  ListBuilder<CommentModel> get comments =>
      _$this._comments ??= new ListBuilder<CommentModel>();
  set comments(ListBuilder<CommentModel>? comments) =>
      _$this._comments = comments;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  PostScreenStateBuilder();

  PostScreenStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _success = $v.success;
      _comments = $v.comments.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _isLoading = $v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostScreenState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostScreenState;
  }

  @override
  void update(void Function(PostScreenStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostScreenState build() => _build();

  _$PostScreenState _build() {
    _$PostScreenState _$result;
    try {
      _$result = _$v ??
          new _$PostScreenState._(
              error: error,
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'PostScreenState', 'success'),
              comments: comments.build(),
              paginator: paginator.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'PostScreenState', 'isLoading'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comments';
        comments.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostScreenState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
