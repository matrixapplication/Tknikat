// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostsState extends PostsState {
  @override
  final bool isLoading;
  @override
  final bool addSuccess;
  @override
  final bool editSuccess;
  @override
  final bool removeSuccess;
  @override
  final String? error;
  @override
  final BuiltList<PostModel> myPosts;
  @override
  final BuiltList<PostModel> posts;
  @override
  final Paginator myPostsPaginator;
  @override
  final Paginator postsPaginator;
  @override
  final bool initialized;

  factory _$PostsState([void Function(PostsStateBuilder)? updates]) =>
      (new PostsStateBuilder()..update(updates))._build();

  _$PostsState._(
      {required this.isLoading,
      required this.addSuccess,
      required this.editSuccess,
      required this.removeSuccess,
      this.error,
      required this.myPosts,
      required this.posts,
      required this.myPostsPaginator,
      required this.postsPaginator,
      required this.initialized})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'PostsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        addSuccess, r'PostsState', 'addSuccess');
    BuiltValueNullFieldError.checkNotNull(
        editSuccess, r'PostsState', 'editSuccess');
    BuiltValueNullFieldError.checkNotNull(
        removeSuccess, r'PostsState', 'removeSuccess');
    BuiltValueNullFieldError.checkNotNull(myPosts, r'PostsState', 'myPosts');
    BuiltValueNullFieldError.checkNotNull(posts, r'PostsState', 'posts');
    BuiltValueNullFieldError.checkNotNull(
        myPostsPaginator, r'PostsState', 'myPostsPaginator');
    BuiltValueNullFieldError.checkNotNull(
        postsPaginator, r'PostsState', 'postsPaginator');
    BuiltValueNullFieldError.checkNotNull(
        initialized, r'PostsState', 'initialized');
  }

  @override
  PostsState rebuild(void Function(PostsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsStateBuilder toBuilder() => new PostsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsState &&
        isLoading == other.isLoading &&
        addSuccess == other.addSuccess &&
        editSuccess == other.editSuccess &&
        removeSuccess == other.removeSuccess &&
        error == other.error &&
        myPosts == other.myPosts &&
        posts == other.posts &&
        myPostsPaginator == other.myPostsPaginator &&
        postsPaginator == other.postsPaginator &&
        initialized == other.initialized;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, addSuccess.hashCode);
    _$hash = $jc(_$hash, editSuccess.hashCode);
    _$hash = $jc(_$hash, removeSuccess.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, myPosts.hashCode);
    _$hash = $jc(_$hash, posts.hashCode);
    _$hash = $jc(_$hash, myPostsPaginator.hashCode);
    _$hash = $jc(_$hash, postsPaginator.hashCode);
    _$hash = $jc(_$hash, initialized.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostsState')
          ..add('isLoading', isLoading)
          ..add('addSuccess', addSuccess)
          ..add('editSuccess', editSuccess)
          ..add('removeSuccess', removeSuccess)
          ..add('error', error)
          ..add('myPosts', myPosts)
          ..add('posts', posts)
          ..add('myPostsPaginator', myPostsPaginator)
          ..add('postsPaginator', postsPaginator)
          ..add('initialized', initialized))
        .toString();
  }
}

class PostsStateBuilder implements Builder<PostsState, PostsStateBuilder> {
  _$PostsState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _addSuccess;
  bool? get addSuccess => _$this._addSuccess;
  set addSuccess(bool? addSuccess) => _$this._addSuccess = addSuccess;

  bool? _editSuccess;
  bool? get editSuccess => _$this._editSuccess;
  set editSuccess(bool? editSuccess) => _$this._editSuccess = editSuccess;

  bool? _removeSuccess;
  bool? get removeSuccess => _$this._removeSuccess;
  set removeSuccess(bool? removeSuccess) =>
      _$this._removeSuccess = removeSuccess;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  ListBuilder<PostModel>? _myPosts;
  ListBuilder<PostModel> get myPosts =>
      _$this._myPosts ??= new ListBuilder<PostModel>();
  set myPosts(ListBuilder<PostModel>? myPosts) => _$this._myPosts = myPosts;

  ListBuilder<PostModel>? _posts;
  ListBuilder<PostModel> get posts =>
      _$this._posts ??= new ListBuilder<PostModel>();
  set posts(ListBuilder<PostModel>? posts) => _$this._posts = posts;

  PaginatorBuilder? _myPostsPaginator;
  PaginatorBuilder get myPostsPaginator =>
      _$this._myPostsPaginator ??= new PaginatorBuilder();
  set myPostsPaginator(PaginatorBuilder? myPostsPaginator) =>
      _$this._myPostsPaginator = myPostsPaginator;

  PaginatorBuilder? _postsPaginator;
  PaginatorBuilder get postsPaginator =>
      _$this._postsPaginator ??= new PaginatorBuilder();
  set postsPaginator(PaginatorBuilder? postsPaginator) =>
      _$this._postsPaginator = postsPaginator;

  bool? _initialized;
  bool? get initialized => _$this._initialized;
  set initialized(bool? initialized) => _$this._initialized = initialized;

  PostsStateBuilder();

  PostsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _addSuccess = $v.addSuccess;
      _editSuccess = $v.editSuccess;
      _removeSuccess = $v.removeSuccess;
      _error = $v.error;
      _myPosts = $v.myPosts.toBuilder();
      _posts = $v.posts.toBuilder();
      _myPostsPaginator = $v.myPostsPaginator.toBuilder();
      _postsPaginator = $v.postsPaginator.toBuilder();
      _initialized = $v.initialized;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsState;
  }

  @override
  void update(void Function(PostsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostsState build() => _build();

  _$PostsState _build() {
    _$PostsState _$result;
    try {
      _$result = _$v ??
          new _$PostsState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'PostsState', 'isLoading'),
            addSuccess: BuiltValueNullFieldError.checkNotNull(
                addSuccess, r'PostsState', 'addSuccess'),
            editSuccess: BuiltValueNullFieldError.checkNotNull(
                editSuccess, r'PostsState', 'editSuccess'),
            removeSuccess: BuiltValueNullFieldError.checkNotNull(
                removeSuccess, r'PostsState', 'removeSuccess'),
            error: error,
            myPosts: myPosts.build(),
            posts: posts.build(),
            myPostsPaginator: myPostsPaginator.build(),
            postsPaginator: postsPaginator.build(),
            initialized: BuiltValueNullFieldError.checkNotNull(
                initialized, r'PostsState', 'initialized'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'myPosts';
        myPosts.build();
        _$failedField = 'posts';
        posts.build();
        _$failedField = 'myPostsPaginator';
        myPostsPaginator.build();
        _$failedField = 'postsPaginator';
        postsPaginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
