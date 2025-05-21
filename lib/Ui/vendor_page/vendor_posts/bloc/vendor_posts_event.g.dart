// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_posts_event.dart';

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

class _$GetVendorPosts extends GetVendorPosts {
  @override
  final int id;

  factory _$GetVendorPosts([void Function(GetVendorPostsBuilder)? updates]) =>
      (new GetVendorPostsBuilder()..update(updates))._build();

  _$GetVendorPosts._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'GetVendorPosts', 'id');
  }

  @override
  GetVendorPosts rebuild(void Function(GetVendorPostsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetVendorPostsBuilder toBuilder() =>
      new GetVendorPostsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetVendorPosts && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GetVendorPosts')..add('id', id))
        .toString();
  }
}

class GetVendorPostsBuilder
    implements Builder<GetVendorPosts, GetVendorPostsBuilder> {
  _$GetVendorPosts? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  GetVendorPostsBuilder();

  GetVendorPostsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetVendorPosts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetVendorPosts;
  }

  @override
  void update(void Function(GetVendorPostsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetVendorPosts build() => _build();

  _$GetVendorPosts _build() {
    final _$result = _$v ??
        new _$GetVendorPosts._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GetVendorPosts', 'id'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GetNextVendorPosts extends GetNextVendorPosts {
  @override
  final int? id;

  factory _$GetNextVendorPosts(
          [void Function(GetNextVendorPostsBuilder)? updates]) =>
      (new GetNextVendorPostsBuilder()..update(updates))._build();

  _$GetNextVendorPosts._({this.id}) : super._();

  @override
  GetNextVendorPosts rebuild(
          void Function(GetNextVendorPostsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNextVendorPostsBuilder toBuilder() =>
      new GetNextVendorPostsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNextVendorPosts && id == other.id;
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
    return (newBuiltValueToStringHelper(r'GetNextVendorPosts')..add('id', id))
        .toString();
  }
}

class GetNextVendorPostsBuilder
    implements Builder<GetNextVendorPosts, GetNextVendorPostsBuilder> {
  _$GetNextVendorPosts? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  GetNextVendorPostsBuilder();

  GetNextVendorPostsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetNextVendorPosts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNextVendorPosts;
  }

  @override
  void update(void Function(GetNextVendorPostsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNextVendorPosts build() => _build();

  _$GetNextVendorPosts _build() {
    final _$result = _$v ??
        new _$GetNextVendorPosts._(
          id: id,
        );
    replace(_$result);
    return _$result;
  }
}

class _$LikePost extends LikePost {
  @override
  final int? id;

  factory _$LikePost([void Function(LikePostBuilder)? updates]) =>
      (new LikePostBuilder()..update(updates))._build();

  _$LikePost._({this.id}) : super._();

  @override
  LikePost rebuild(void Function(LikePostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LikePostBuilder toBuilder() => new LikePostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LikePost && id == other.id;
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
    return (newBuiltValueToStringHelper(r'LikePost')..add('id', id)).toString();
  }
}

class LikePostBuilder implements Builder<LikePost, LikePostBuilder> {
  _$LikePost? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  LikePostBuilder();

  LikePostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LikePost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LikePost;
  }

  @override
  void update(void Function(LikePostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LikePost build() => _build();

  _$LikePost _build() {
    final _$result = _$v ??
        new _$LikePost._(
          id: id,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
