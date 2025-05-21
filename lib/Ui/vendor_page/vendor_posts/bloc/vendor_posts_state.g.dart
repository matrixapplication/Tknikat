// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_posts_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$VendorPostsState extends VendorPostsState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final bool success;
  @override
  final BuiltList<PostModel> posts;
  @override
  final Paginator postsPaginator;
  @override
  final bool initialized;

  factory _$VendorPostsState(
          [void Function(VendorPostsStateBuilder)? updates]) =>
      (new VendorPostsStateBuilder()..update(updates))._build();

  _$VendorPostsState._(
      {this.error,
      required this.isLoading,
      required this.success,
      required this.posts,
      required this.postsPaginator,
      required this.initialized})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'VendorPostsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        success, r'VendorPostsState', 'success');
    BuiltValueNullFieldError.checkNotNull(posts, r'VendorPostsState', 'posts');
    BuiltValueNullFieldError.checkNotNull(
        postsPaginator, r'VendorPostsState', 'postsPaginator');
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'VendorPostsState', 'initialized');
  }

  @override
  VendorPostsState rebuild(void Function(VendorPostsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VendorPostsStateBuilder toBuilder() =>
      new VendorPostsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VendorPostsState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        posts == other.posts &&
        postsPaginator == other.postsPaginator &&
        initialized == other.initialized;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, posts.hashCode);
    _$hash = $jc(_$hash, postsPaginator.hashCode);
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VendorPostsState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('posts', posts)
          ..add('postsPaginator', postsPaginator)
          ..add('initialized', initialized))
        .toString();
  }
}

class VendorPostsStateBuilder
    implements Builder<VendorPostsState, VendorPostsStateBuilder> {
  _$VendorPostsState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<PostModel>? _posts;
  ListBuilder<PostModel> get posts =>
      _$this._posts ??= new ListBuilder<PostModel>();
  set posts(ListBuilder<PostModel>? posts) => _$this._posts = posts;

  PaginatorBuilder? _postsPaginator;
  PaginatorBuilder get postsPaginator =>
      _$this._postsPaginator ??= new PaginatorBuilder();
  set postsPaginator(PaginatorBuilder? postsPaginator) =>
      _$this._postsPaginator = postsPaginator;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  VendorPostsStateBuilder();

  VendorPostsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _posts = $v.posts.toBuilder();
      _postsPaginator = $v.postsPaginator.toBuilder();
      _initialized = $v.initialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VendorPostsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VendorPostsState;
  }

  @override
  void update(void Function(VendorPostsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VendorPostsState build() => _build();

  _$VendorPostsState _build() {
    _$VendorPostsState _$result;
    try {
      _$result = _$v ??
          new _$VendorPostsState._(
            error: error,
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'VendorPostsState', 'isLoading'),
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'VendorPostsState', 'success'),
            posts: posts.build(),
            postsPaginator: postsPaginator.build(),
            initialized: BuiltValueNullFieldError.checkNotNull(
                initialized, r'VendorPostsState', 'initialized'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'posts';
        posts.build();
        _$failedField = 'postsPaginator';
        postsPaginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VendorPostsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
