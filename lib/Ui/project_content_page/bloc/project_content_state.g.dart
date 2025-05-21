// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_content_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProjectContentState extends ProjectContentState {
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

  factory _$ProjectContentState(
          [void Function(ProjectContentStateBuilder)? updates]) =>
      (new ProjectContentStateBuilder()..update(updates))._build();

  _$ProjectContentState._(
      {this.error,
      required this.success,
      required this.isLoading,
      required this.comments,
      required this.paginator})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, r'ProjectContentState', 'success');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'ProjectContentState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        comments, r'ProjectContentState', 'comments');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'ProjectContentState', 'paginator');
  }

  @override
  ProjectContentState rebuild(
          void Function(ProjectContentStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectContentStateBuilder toBuilder() =>
      new ProjectContentStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProjectContentState &&
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
    return (newBuiltValueToStringHelper(r'ProjectContentState')
          ..add('error', error)
          ..add('success', success)
          ..add('isLoading', isLoading)
          ..add('comments', comments)
          ..add('paginator', paginator))
        .toString();
  }
}

class ProjectContentStateBuilder
    implements Builder<ProjectContentState, ProjectContentStateBuilder> {
  _$ProjectContentState? _$v;

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

  ProjectContentStateBuilder();

  ProjectContentStateBuilder get _$this {
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
  void replace(ProjectContentState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProjectContentState;
  }

  @override
  void update(void Function(ProjectContentStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProjectContentState build() => _build();

  _$ProjectContentState _build() {
    _$ProjectContentState _$result;
    try {
      _$result = _$v ??
          new _$ProjectContentState._(
            error: error,
            success: BuiltValueNullFieldError.checkNotNull(
                success, r'ProjectContentState', 'success'),
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'ProjectContentState', 'isLoading'),
            comments: comments.build(),
            paginator: paginator.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comments';
        comments.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProjectContentState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
