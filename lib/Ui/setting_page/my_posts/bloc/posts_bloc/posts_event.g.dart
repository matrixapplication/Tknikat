// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitMyPosts extends InitMyPosts {
  factory _$InitMyPosts([void Function(InitMyPostsBuilder)? updates]) =>
      (new InitMyPostsBuilder()..update(updates))._build();

  _$InitMyPosts._() : super._();

  @override
  InitMyPosts rebuild(void Function(InitMyPostsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitMyPostsBuilder toBuilder() => new InitMyPostsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitMyPosts;
  }

  @override
  int get hashCode {
    return 868888839;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'InitMyPosts').toString();
  }
}

class InitMyPostsBuilder implements Builder<InitMyPosts, InitMyPostsBuilder> {
  _$InitMyPosts? _$v;

  InitMyPostsBuilder();

  @override
  void replace(InitMyPosts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitMyPosts;
  }

  @override
  void update(void Function(InitMyPostsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitMyPosts build() => _build();

  _$InitMyPosts _build() {
    final _$result = _$v ?? new _$InitMyPosts._();
    replace(_$result);
    return _$result;
  }
}

class _$InitPosts extends InitPosts {
  @override
  final int? page;

  factory _$InitPosts([void Function(InitPostsBuilder)? updates]) =>
      (new InitPostsBuilder()..update(updates))._build();

  _$InitPosts._({this.page}) : super._();

  @override
  InitPosts rebuild(void Function(InitPostsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitPostsBuilder toBuilder() => new InitPostsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitPosts && page == other.page;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitPosts')..add('page', page))
        .toString();
  }
}

class InitPostsBuilder implements Builder<InitPosts, InitPostsBuilder> {
  _$InitPosts? _$v;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  InitPostsBuilder();

  InitPostsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitPosts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitPosts;
  }

  @override
  void update(void Function(InitPostsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitPosts build() => _build();

  _$InitPosts _build() {
    final _$result = _$v ??
        new _$InitPosts._(
          page: page,
        );
    replace(_$result);
    return _$result;
  }
}

class _$AddPost extends AddPost {
  @override
  final String description;
  @override
  final List<File> images;
  @override
  final List<AddPostModel> subPosts;
  @override
  final String id;

  factory _$AddPost([void Function(AddPostBuilder)? updates]) =>
      (new AddPostBuilder()..update(updates))._build();

  _$AddPost._(
      {required this.description,
      required this.images,
      required this.subPosts,
      required this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        description, r'AddPost', 'description');
    BuiltValueNullFieldError.checkNotNull(images, r'AddPost', 'images');
    BuiltValueNullFieldError.checkNotNull(subPosts, r'AddPost', 'subPosts');
    BuiltValueNullFieldError.checkNotNull(id, r'AddPost', 'id');
  }

  @override
  AddPost rebuild(void Function(AddPostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddPostBuilder toBuilder() => new AddPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddPost &&
        description == other.description &&
        images == other.images &&
        subPosts == other.subPosts &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, subPosts.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddPost')
          ..add('description', description)
          ..add('images', images)
          ..add('subPosts', subPosts)
          ..add('id', id))
        .toString();
  }
}

class AddPostBuilder implements Builder<AddPost, AddPostBuilder> {
  _$AddPost? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  List<File>? _images;
  List<File>? get images => _$this._images;
  set images(List<File>? images) => _$this._images = images;

  List<AddPostModel>? _subPosts;
  List<AddPostModel>? get subPosts => _$this._subPosts;
  set subPosts(List<AddPostModel>? subPosts) => _$this._subPosts = subPosts;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  AddPostBuilder();

  AddPostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _images = $v.images;
      _subPosts = $v.subPosts;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddPost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddPost;
  }

  @override
  void update(void Function(AddPostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddPost build() => _build();

  _$AddPost _build() {
    final _$result = _$v ??
        new _$AddPost._(
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'AddPost', 'description'),
          images: BuiltValueNullFieldError.checkNotNull(
              images, r'AddPost', 'images'),
          subPosts: BuiltValueNullFieldError.checkNotNull(
              subPosts, r'AddPost', 'subPosts'),
          id: BuiltValueNullFieldError.checkNotNull(id, r'AddPost', 'id'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$RemovePost extends RemovePost {
  @override
  final PostModel post;

  factory _$RemovePost([void Function(RemovePostBuilder)? updates]) =>
      (new RemovePostBuilder()..update(updates))._build();

  _$RemovePost._({required this.post}) : super._() {
    BuiltValueNullFieldError.checkNotNull(post, r'RemovePost', 'post');
  }

  @override
  RemovePost rebuild(void Function(RemovePostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemovePostBuilder toBuilder() => new RemovePostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemovePost && post == other.post;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, post.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RemovePost')..add('post', post))
        .toString();
  }
}

class RemovePostBuilder implements Builder<RemovePost, RemovePostBuilder> {
  _$RemovePost? _$v;

  PostModelBuilder? _post;
  PostModelBuilder get post => _$this._post ??= new PostModelBuilder();
  set post(PostModelBuilder? post) => _$this._post = post;

  RemovePostBuilder();

  RemovePostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _post = $v.post.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemovePost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RemovePost;
  }

  @override
  void update(void Function(RemovePostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RemovePost build() => _build();

  _$RemovePost _build() {
    _$RemovePost _$result;
    try {
      _$result = _$v ??
          new _$RemovePost._(
            post: post.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'post';
        post.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RemovePost', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EditPost extends EditPost {
  @override
  final int? id;
  @override
  final String description;
  @override
  final List<File> images;
  @override
  final List<String> imagesToRemove;
  @override
  final List<SubPostParam> subPosts;

  factory _$EditPost([void Function(EditPostBuilder)? updates]) =>
      (new EditPostBuilder()..update(updates))._build();

  _$EditPost._(
      {this.id,
      required this.description,
      required this.images,
      required this.imagesToRemove,
      required this.subPosts})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        description, r'EditPost', 'description');
    BuiltValueNullFieldError.checkNotNull(images, r'EditPost', 'images');
    BuiltValueNullFieldError.checkNotNull(
        imagesToRemove, r'EditPost', 'imagesToRemove');
    BuiltValueNullFieldError.checkNotNull(subPosts, r'EditPost', 'subPosts');
  }

  @override
  EditPost rebuild(void Function(EditPostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditPostBuilder toBuilder() => new EditPostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditPost &&
        id == other.id &&
        description == other.description &&
        images == other.images &&
        imagesToRemove == other.imagesToRemove &&
        subPosts == other.subPosts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, imagesToRemove.hashCode);
    _$hash = $jc(_$hash, subPosts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EditPost')
          ..add('id', id)
          ..add('description', description)
          ..add('images', images)
          ..add('imagesToRemove', imagesToRemove)
          ..add('subPosts', subPosts))
        .toString();
  }
}

class EditPostBuilder implements Builder<EditPost, EditPostBuilder> {
  _$EditPost? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  List<File>? _images;
  List<File>? get images => _$this._images;
  set images(List<File>? images) => _$this._images = images;

  List<String>? _imagesToRemove;
  List<String>? get imagesToRemove => _$this._imagesToRemove;
  set imagesToRemove(List<String>? imagesToRemove) =>
      _$this._imagesToRemove = imagesToRemove;

  List<SubPostParam>? _subPosts;
  List<SubPostParam>? get subPosts => _$this._subPosts;
  set subPosts(List<SubPostParam>? subPosts) => _$this._subPosts = subPosts;

  EditPostBuilder();

  EditPostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _description = $v.description;
      _images = $v.images;
      _imagesToRemove = $v.imagesToRemove;
      _subPosts = $v.subPosts;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditPost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EditPost;
  }

  @override
  void update(void Function(EditPostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EditPost build() => _build();

  _$EditPost _build() {
    final _$result = _$v ??
        new _$EditPost._(
          id: id,
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'EditPost', 'description'),
          images: BuiltValueNullFieldError.checkNotNull(
              images, r'EditPost', 'images'),
          imagesToRemove: BuiltValueNullFieldError.checkNotNull(
              imagesToRemove, r'EditPost', 'imagesToRemove'),
          subPosts: BuiltValueNullFieldError.checkNotNull(
              subPosts, r'EditPost', 'subPosts'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$ClearState extends ClearState {
  factory _$ClearState([void Function(ClearStateBuilder)? updates]) =>
      (new ClearStateBuilder()..update(updates))._build();

  _$ClearState._() : super._();

  @override
  ClearState rebuild(void Function(ClearStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearStateBuilder toBuilder() => new ClearStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearState;
  }

  @override
  int get hashCode {
    return 338996177;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearState').toString();
  }
}

class ClearStateBuilder implements Builder<ClearState, ClearStateBuilder> {
  _$ClearState? _$v;

  ClearStateBuilder();

  @override
  void replace(ClearState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearState;
  }

  @override
  void update(void Function(ClearStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearState build() => _build();

  _$ClearState _build() {
    final _$result = _$v ?? new _$ClearState._();
    replace(_$result);
    return _$result;
  }
}

class _$GetMyPosts extends GetMyPosts {
  factory _$GetMyPosts([void Function(GetMyPostsBuilder)? updates]) =>
      (new GetMyPostsBuilder()..update(updates))._build();

  _$GetMyPosts._() : super._();

  @override
  GetMyPosts rebuild(void Function(GetMyPostsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetMyPostsBuilder toBuilder() => new GetMyPostsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetMyPosts;
  }

  @override
  int get hashCode {
    return 547947283;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetMyPosts').toString();
  }
}

class GetMyPostsBuilder implements Builder<GetMyPosts, GetMyPostsBuilder> {
  _$GetMyPosts? _$v;

  GetMyPostsBuilder();

  @override
  void replace(GetMyPosts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetMyPosts;
  }

  @override
  void update(void Function(GetMyPostsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetMyPosts build() => _build();

  _$GetMyPosts _build() {
    final _$result = _$v ?? new _$GetMyPosts._();
    replace(_$result);
    return _$result;
  }
}

class _$GetNextMyPosts extends GetNextMyPosts {
  factory _$GetNextMyPosts([void Function(GetNextMyPostsBuilder)? updates]) =>
      (new GetNextMyPostsBuilder()..update(updates))._build();

  _$GetNextMyPosts._() : super._();

  @override
  GetNextMyPosts rebuild(void Function(GetNextMyPostsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNextMyPostsBuilder toBuilder() =>
      new GetNextMyPostsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNextMyPosts;
  }

  @override
  int get hashCode {
    return 114320258;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetNextMyPosts').toString();
  }
}

class GetNextMyPostsBuilder
    implements Builder<GetNextMyPosts, GetNextMyPostsBuilder> {
  _$GetNextMyPosts? _$v;

  GetNextMyPostsBuilder();

  @override
  void replace(GetNextMyPosts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNextMyPosts;
  }

  @override
  void update(void Function(GetNextMyPostsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNextMyPosts build() => _build();

  _$GetNextMyPosts _build() {
    final _$result = _$v ?? new _$GetNextMyPosts._();
    replace(_$result);
    return _$result;
  }
}

class _$GetNextPosts extends GetNextPosts {
  @override
  final bool? isCurrentPage;

  factory _$GetNextPosts([void Function(GetNextPostsBuilder)? updates]) =>
      (new GetNextPostsBuilder()..update(updates))._build();

  _$GetNextPosts._({this.isCurrentPage}) : super._();

  @override
  GetNextPosts rebuild(void Function(GetNextPostsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNextPostsBuilder toBuilder() => new GetNextPostsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNextPosts && isCurrentPage == other.isCurrentPage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isCurrentPage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetNextPosts')
          ..add('isCurrentPage', isCurrentPage))
        .toString();
  }
}

class GetNextPostsBuilder
    implements Builder<GetNextPosts, GetNextPostsBuilder> {
  _$GetNextPosts? _$v;

  bool? _isCurrentPage;
  bool? get isCurrentPage => _$this._isCurrentPage;
  set isCurrentPage(bool? isCurrentPage) =>
      _$this._isCurrentPage = isCurrentPage;

  GetNextPostsBuilder();

  GetNextPostsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isCurrentPage = $v.isCurrentPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetNextPosts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNextPosts;
  }

  @override
  void update(void Function(GetNextPostsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNextPosts build() => _build();

  _$GetNextPosts _build() {
    final _$result = _$v ??
        new _$GetNextPosts._(
          isCurrentPage: isCurrentPage,
        );
    replace(_$result);
    return _$result;
  }
}

class _$GetLikePost extends GetLikePost {
  @override
  final int? id;

  factory _$GetLikePost([void Function(GetLikePostBuilder)? updates]) =>
      (new GetLikePostBuilder()..update(updates))._build();

  _$GetLikePost._({this.id}) : super._();

  @override
  GetLikePost rebuild(void Function(GetLikePostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetLikePostBuilder toBuilder() => new GetLikePostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetLikePost && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetLikePost')..add('id', id))
        .toString();
  }
}

class GetLikePostBuilder implements Builder<GetLikePost, GetLikePostBuilder> {
  _$GetLikePost? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  GetLikePostBuilder();

  GetLikePostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetLikePost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetLikePost;
  }

  @override
  void update(void Function(GetLikePostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetLikePost build() => _build();

  _$GetLikePost _build() {
    final _$result = _$v ??
        new _$GetLikePost._(
          id: id,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
