// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PostModel extends PostModel {
  @override
  final int? id;
  @override
  final String? featuredImage;
  @override
  final int? likes;
  @override
  final int? commentCount;
  @override
  final BuiltList<String>? images;
  @override
  final BuiltList<File>? addedImages;
  @override
  final String? slug;
  @override
  final bool? isLikedBy;
  @override
  final String? description;
  @override
  final String? createdAt;
  @override
  final BuiltList<PostModel>? subPosts;
  @override
  final UserModel? user;

  factory _$PostModel([void Function(PostModelBuilder)? updates]) =>
      (new PostModelBuilder()..update(updates))._build();

  _$PostModel._(
      {this.id,
      this.featuredImage,
      this.likes,
      this.commentCount,
      this.images,
      this.addedImages,
      this.slug,
      this.isLikedBy,
      this.description,
      this.createdAt,
      this.subPosts,
      this.user})
      : super._();

  @override
  PostModel rebuild(void Function(PostModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostModelBuilder toBuilder() => new PostModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostModel &&
        id == other.id &&
        featuredImage == other.featuredImage &&
        likes == other.likes &&
        commentCount == other.commentCount &&
        images == other.images &&
        addedImages == other.addedImages &&
        slug == other.slug &&
        isLikedBy == other.isLikedBy &&
        description == other.description &&
        createdAt == other.createdAt &&
        subPosts == other.subPosts &&
        user == other.user;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, featuredImage.hashCode);
    _$hash = $jc(_$hash, likes.hashCode);
    _$hash = $jc(_$hash, commentCount.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, addedImages.hashCode);
    _$hash = $jc(_$hash, slug.hashCode);
    _$hash = $jc(_$hash, isLikedBy.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, subPosts.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostModel')
          ..add('id', id)
          ..add('featuredImage', featuredImage)
          ..add('likes', likes)
          ..add('commentCount', commentCount)
          ..add('images', images)
          ..add('addedImages', addedImages)
          ..add('slug', slug)
          ..add('isLikedBy', isLikedBy)
          ..add('description', description)
          ..add('createdAt', createdAt)
          ..add('subPosts', subPosts)
          ..add('user', user))
        .toString();
  }
}

class PostModelBuilder implements Builder<PostModel, PostModelBuilder> {
  _$PostModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _featuredImage;
  String? get featuredImage => _$this._featuredImage;
  set featuredImage(String? featuredImage) =>
      _$this._featuredImage = featuredImage;

  int? _likes;
  int? get likes => _$this._likes;
  set likes(int? likes) => _$this._likes = likes;

  int? _commentCount;
  int? get commentCount => _$this._commentCount;
  set commentCount(int? commentCount) => _$this._commentCount = commentCount;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  ListBuilder<File>? _addedImages;
  ListBuilder<File> get addedImages =>
      _$this._addedImages ??= new ListBuilder<File>();
  set addedImages(ListBuilder<File>? addedImages) =>
      _$this._addedImages = addedImages;

  String? _slug;
  String? get slug => _$this._slug;
  set slug(String? slug) => _$this._slug = slug;

  bool? _isLikedBy;
  bool? get isLikedBy => _$this._isLikedBy;
  set isLikedBy(bool? isLikedBy) => _$this._isLikedBy = isLikedBy;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  ListBuilder<PostModel>? _subPosts;
  ListBuilder<PostModel> get subPosts =>
      _$this._subPosts ??= new ListBuilder<PostModel>();
  set subPosts(ListBuilder<PostModel>? subPosts) => _$this._subPosts = subPosts;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  PostModelBuilder();

  PostModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _featuredImage = $v.featuredImage;
      _likes = $v.likes;
      _commentCount = $v.commentCount;
      _images = $v.images?.toBuilder();
      _addedImages = $v.addedImages?.toBuilder();
      _slug = $v.slug;
      _isLikedBy = $v.isLikedBy;
      _description = $v.description;
      _createdAt = $v.createdAt;
      _subPosts = $v.subPosts?.toBuilder();
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostModel;
  }

  @override
  void update(void Function(PostModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostModel build() => _build();

  _$PostModel _build() {
    _$PostModel _$result;
    try {
      _$result = _$v ??
          new _$PostModel._(
            id: id,
            featuredImage: featuredImage,
            likes: likes,
            commentCount: commentCount,
            images: _images?.build(),
            addedImages: _addedImages?.build(),
            slug: slug,
            isLikedBy: isLikedBy,
            description: description,
            createdAt: createdAt,
            subPosts: _subPosts?.build(),
            user: _user?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
        _$failedField = 'addedImages';
        _addedImages?.build();

        _$failedField = 'subPosts';
        _subPosts?.build();
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
