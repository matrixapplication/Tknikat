// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_projects_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AllProjectsState extends AllProjectsState {
  @override
  final String? error;
  @override
  final bool isLoading;
  @override
  final BuiltList<ProjectModel> projects;
  @override
  final Paginator paginator;

  factory _$AllProjectsState(
          [void Function(AllProjectsStateBuilder)? updates]) =>
      (new AllProjectsStateBuilder()..update(updates))._build();

  _$AllProjectsState._(
      {this.error,
      required this.isLoading,
      required this.projects,
      required this.paginator})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'AllProjectsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        projects, r'AllProjectsState', 'projects');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'AllProjectsState', 'paginator');
  }

  @override
  AllProjectsState rebuild(void Function(AllProjectsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllProjectsStateBuilder toBuilder() =>
      new AllProjectsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllProjectsState &&
        error == other.error &&
        isLoading == other.isLoading &&
        projects == other.projects &&
        paginator == other.paginator;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, projects.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AllProjectsState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('projects', projects)
          ..add('paginator', paginator))
        .toString();
  }
}

class AllProjectsStateBuilder
    implements Builder<AllProjectsState, AllProjectsStateBuilder> {
  _$AllProjectsState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  ListBuilder<ProjectModel>? _projects;
  ListBuilder<ProjectModel> get projects =>
      _$this._projects ??= new ListBuilder<ProjectModel>();
  set projects(ListBuilder<ProjectModel>? projects) =>
      _$this._projects = projects;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  AllProjectsStateBuilder();

  AllProjectsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _projects = $v.projects.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllProjectsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllProjectsState;
  }

  @override
  void update(void Function(AllProjectsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AllProjectsState build() => _build();

  _$AllProjectsState _build() {
    _$AllProjectsState _$result;
    try {
      _$result = _$v ??
          new _$AllProjectsState._(
            error: error,
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'AllProjectsState', 'isLoading'),
            projects: projects.build(),
            paginator: paginator.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'projects';
        projects.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllProjectsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
