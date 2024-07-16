// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_content_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClearError extends ClearError {
  factory _$ClearError([void Function(ClearErrorBuilder)? updates]) =>
      (new ClearErrorBuilder()..update(updates))._build();

  _$ClearError._() : super._();

  @override
  ClearError rebuild(void Function(ClearErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClearErrorBuilder toBuilder() => new ClearErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClearError;
  }

  @override
  int get hashCode {
    return 507656265;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ClearError').toString();
  }
}

class ClearErrorBuilder implements Builder<ClearError, ClearErrorBuilder> {
  _$ClearError? _$v;

  ClearErrorBuilder();

  @override
  void replace(ClearError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClearError;
  }

  @override
  void update(void Function(ClearErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClearError build() => _build();

  _$ClearError _build() {
    final _$result = _$v ?? new _$ClearError._();
    replace(_$result);
    return _$result;
  }
}

class _$GetComments extends GetComments {
  @override
  final int model_id;

  factory _$GetComments([void Function(GetCommentsBuilder)? updates]) =>
      (new GetCommentsBuilder()..update(updates))._build();

  _$GetComments._({required this.model_id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(model_id, r'GetComments', 'model_id');
  }

  @override
  GetComments rebuild(void Function(GetCommentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCommentsBuilder toBuilder() => new GetCommentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetComments && model_id == other.model_id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, model_id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetComments')
          ..add('model_id', model_id))
        .toString();
  }
}

class GetCommentsBuilder implements Builder<GetComments, GetCommentsBuilder> {
  _$GetComments? _$v;

  int? _model_id;
  int? get model_id => _$this._model_id;
  set model_id(int? model_id) => _$this._model_id = model_id;

  GetCommentsBuilder();

  GetCommentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _model_id = $v.model_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetComments other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetComments;
  }

  @override
  void update(void Function(GetCommentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetComments build() => _build();

  _$GetComments _build() {
    final _$result = _$v ??
        new _$GetComments._(
            model_id: BuiltValueNullFieldError.checkNotNull(
                model_id, r'GetComments', 'model_id'));
    replace(_$result);
    return _$result;
  }
}

class _$AddComment extends AddComment {
  @override
  final String comment;
  @override
  final int id;
  @override
  final int? parentCommentId;
  @override
  final int? repliedUserId;

  factory _$AddComment([void Function(AddCommentBuilder)? updates]) =>
      (new AddCommentBuilder()..update(updates))._build();

  _$AddComment._(
      {required this.comment,
      required this.id,
      this.parentCommentId,
      this.repliedUserId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(comment, r'AddComment', 'comment');
    BuiltValueNullFieldError.checkNotNull(id, r'AddComment', 'id');
  }

  @override
  AddComment rebuild(void Function(AddCommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddCommentBuilder toBuilder() => new AddCommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddComment &&
        comment == other.comment &&
        id == other.id &&
        parentCommentId == other.parentCommentId &&
        repliedUserId == other.repliedUserId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, parentCommentId.hashCode);
    _$hash = $jc(_$hash, repliedUserId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddComment')
          ..add('comment', comment)
          ..add('id', id)
          ..add('parentCommentId', parentCommentId)
          ..add('repliedUserId', repliedUserId))
        .toString();
  }
}

class AddCommentBuilder implements Builder<AddComment, AddCommentBuilder> {
  _$AddComment? _$v;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _parentCommentId;
  int? get parentCommentId => _$this._parentCommentId;
  set parentCommentId(int? parentCommentId) =>
      _$this._parentCommentId = parentCommentId;

  int? _repliedUserId;
  int? get repliedUserId => _$this._repliedUserId;
  set repliedUserId(int? repliedUserId) =>
      _$this._repliedUserId = repliedUserId;

  AddCommentBuilder();

  AddCommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comment = $v.comment;
      _id = $v.id;
      _parentCommentId = $v.parentCommentId;
      _repliedUserId = $v.repliedUserId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddComment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddComment;
  }

  @override
  void update(void Function(AddCommentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddComment build() => _build();

  _$AddComment _build() {
    final _$result = _$v ??
        new _$AddComment._(
            comment: BuiltValueNullFieldError.checkNotNull(
                comment, r'AddComment', 'comment'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'AddComment', 'id'),
            parentCommentId: parentCommentId,
            repliedUserId: repliedUserId);
    replace(_$result);
    return _$result;
  }
}

class _$GetNextComments extends GetNextComments {
  @override
  final int model_id;

  factory _$GetNextComments([void Function(GetNextCommentsBuilder)? updates]) =>
      (new GetNextCommentsBuilder()..update(updates))._build();

  _$GetNextComments._({required this.model_id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        model_id, r'GetNextComments', 'model_id');
  }

  @override
  GetNextComments rebuild(void Function(GetNextCommentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNextCommentsBuilder toBuilder() =>
      new GetNextCommentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNextComments && model_id == other.model_id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, model_id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetNextComments')
          ..add('model_id', model_id))
        .toString();
  }
}

class GetNextCommentsBuilder
    implements Builder<GetNextComments, GetNextCommentsBuilder> {
  _$GetNextComments? _$v;

  int? _model_id;
  int? get model_id => _$this._model_id;
  set model_id(int? model_id) => _$this._model_id = model_id;

  GetNextCommentsBuilder();

  GetNextCommentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _model_id = $v.model_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetNextComments other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNextComments;
  }

  @override
  void update(void Function(GetNextCommentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNextComments build() => _build();

  _$GetNextComments _build() {
    final _$result = _$v ??
        new _$GetNextComments._(
            model_id: BuiltValueNullFieldError.checkNotNull(
                model_id, r'GetNextComments', 'model_id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
