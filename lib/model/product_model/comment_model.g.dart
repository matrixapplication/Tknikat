// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommentModel extends CommentModel {
  @override
  final int? id;
  @override
  final int? review;
  @override
  final String? reviewContent;
  @override
  final String? dateCreated;
  @override
  final UserModel? user;
  @override
  final int? rootCommentId;
  @override
  final int? repliedUserId;
  @override
  final UserModel? repliedUser;
  @override
  final BuiltList<CommentModel>? replies;

  factory _$CommentModel([void Function(CommentModelBuilder)? updates]) =>
      (new CommentModelBuilder()..update(updates))._build();

  _$CommentModel._(
      {this.id,
      this.review,
      this.reviewContent,
      this.dateCreated,
      this.user,
      this.rootCommentId,
      this.repliedUserId,
      this.repliedUser,
      this.replies})
      : super._();

  @override
  CommentModel rebuild(void Function(CommentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentModelBuilder toBuilder() => new CommentModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentModel &&
        id == other.id &&
        review == other.review &&
        reviewContent == other.reviewContent &&
        dateCreated == other.dateCreated &&
        user == other.user &&
        rootCommentId == other.rootCommentId &&
        repliedUserId == other.repliedUserId &&
        repliedUser == other.repliedUser &&
        replies == other.replies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, review.hashCode);
    _$hash = $jc(_$hash, reviewContent.hashCode);
    _$hash = $jc(_$hash, dateCreated.hashCode);
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, rootCommentId.hashCode);
    _$hash = $jc(_$hash, repliedUserId.hashCode);
    _$hash = $jc(_$hash, repliedUser.hashCode);
    _$hash = $jc(_$hash, replies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentModel')
          ..add('id', id)
          ..add('review', review)
          ..add('reviewContent', reviewContent)
          ..add('dateCreated', dateCreated)
          ..add('user', user)
          ..add('rootCommentId', rootCommentId)
          ..add('repliedUserId', repliedUserId)
          ..add('repliedUser', repliedUser)
          ..add('replies', replies))
        .toString();
  }
}

class CommentModelBuilder
    implements Builder<CommentModel, CommentModelBuilder> {
  _$CommentModel? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _review;
  int? get review => _$this._review;
  set review(int? review) => _$this._review = review;

  String? _reviewContent;
  String? get reviewContent => _$this._reviewContent;
  set reviewContent(String? reviewContent) =>
      _$this._reviewContent = reviewContent;

  String? _dateCreated;
  String? get dateCreated => _$this._dateCreated;
  set dateCreated(String? dateCreated) => _$this._dateCreated = dateCreated;

  UserModelBuilder? _user;
  UserModelBuilder get user => _$this._user ??= new UserModelBuilder();
  set user(UserModelBuilder? user) => _$this._user = user;

  int? _rootCommentId;
  int? get rootCommentId => _$this._rootCommentId;
  set rootCommentId(int? rootCommentId) =>
      _$this._rootCommentId = rootCommentId;

  int? _repliedUserId;
  int? get repliedUserId => _$this._repliedUserId;
  set repliedUserId(int? repliedUserId) =>
      _$this._repliedUserId = repliedUserId;

  UserModelBuilder? _repliedUser;
  UserModelBuilder get repliedUser =>
      _$this._repliedUser ??= new UserModelBuilder();
  set repliedUser(UserModelBuilder? repliedUser) =>
      _$this._repliedUser = repliedUser;

  ListBuilder<CommentModel>? _replies;
  ListBuilder<CommentModel> get replies =>
      _$this._replies ??= new ListBuilder<CommentModel>();
  set replies(ListBuilder<CommentModel>? replies) => _$this._replies = replies;

  CommentModelBuilder();

  CommentModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _review = $v.review;
      _reviewContent = $v.reviewContent;
      _dateCreated = $v.dateCreated;
      _user = $v.user?.toBuilder();
      _rootCommentId = $v.rootCommentId;
      _repliedUserId = $v.repliedUserId;
      _repliedUser = $v.repliedUser?.toBuilder();
      _replies = $v.replies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentModel;
  }

  @override
  void update(void Function(CommentModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentModel build() => _build();

  _$CommentModel _build() {
    _$CommentModel _$result;
    try {
      _$result = _$v ??
          new _$CommentModel._(
              id: id,
              review: review,
              reviewContent: reviewContent,
              dateCreated: dateCreated,
              user: _user?.build(),
              rootCommentId: rootCommentId,
              repliedUserId: repliedUserId,
              repliedUser: _repliedUser?.build(),
              replies: _replies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();

        _$failedField = 'repliedUser';
        _repliedUser?.build();
        _$failedField = 'replies';
        _replies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CommentModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
