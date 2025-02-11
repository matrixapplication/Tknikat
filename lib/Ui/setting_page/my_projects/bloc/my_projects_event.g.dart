// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_projects_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitMyProjects extends InitMyProjects {
  factory _$InitMyProjects([void Function(InitMyProjectsBuilder)? updates]) =>
      (new InitMyProjectsBuilder()..update(updates))._build();

  _$InitMyProjects._() : super._();

  @override
  InitMyProjects rebuild(void Function(InitMyProjectsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitMyProjectsBuilder toBuilder() =>
      new InitMyProjectsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitMyProjects;
  }

  @override
  int get hashCode {
    return 657693059;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'InitMyProjects').toString();
  }
}

class InitMyProjectsBuilder
    implements Builder<InitMyProjects, InitMyProjectsBuilder> {
  _$InitMyProjects? _$v;

  InitMyProjectsBuilder();

  @override
  void replace(InitMyProjects other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitMyProjects;
  }

  @override
  void update(void Function(InitMyProjectsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitMyProjects build() => _build();

  _$InitMyProjects _build() {
    final _$result = _$v ?? new _$InitMyProjects._();
    replace(_$result);
    return _$result;
  }
}

class _$AddProject extends AddProject {
  @override
  final String title;
  @override
  final String description;
  @override
  final String yotubeUrl;
  @override
  final File image;

  factory _$AddProject([void Function(AddProjectBuilder)? updates]) =>
      (new AddProjectBuilder()..update(updates))._build();

  _$AddProject._(
      {required this.title,
      required this.description,
      required this.yotubeUrl,
      required this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(title, r'AddProject', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'AddProject', 'description');
    BuiltValueNullFieldError.checkNotNull(
        yotubeUrl, r'AddProject', 'yotubeUrl');
    BuiltValueNullFieldError.checkNotNull(image, r'AddProject', 'image');
  }

  @override
  AddProject rebuild(void Function(AddProjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddProjectBuilder toBuilder() => new AddProjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddProject &&
        title == other.title &&
        description == other.description &&
        yotubeUrl == other.yotubeUrl &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, yotubeUrl.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddProject')
          ..add('title', title)
          ..add('description', description)
          ..add('yotubeUrl', yotubeUrl)
          ..add('image', image))
        .toString();
  }
}

class AddProjectBuilder implements Builder<AddProject, AddProjectBuilder> {
  _$AddProject? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _yotubeUrl;
  String? get yotubeUrl => _$this._yotubeUrl;
  set yotubeUrl(String? yotubeUrl) => _$this._yotubeUrl = yotubeUrl;

  File? _image;
  File? get image => _$this._image;
  set image(File? image) => _$this._image = image;

  AddProjectBuilder();

  AddProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _yotubeUrl = $v.yotubeUrl;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddProject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddProject;
  }

  @override
  void update(void Function(AddProjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddProject build() => _build();

  _$AddProject _build() {
    final _$result = _$v ??
        new _$AddProject._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'AddProject', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'AddProject', 'description'),
            yotubeUrl: BuiltValueNullFieldError.checkNotNull(
                yotubeUrl, r'AddProject', 'yotubeUrl'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, r'AddProject', 'image'));
    replace(_$result);
    return _$result;
  }
}

class _$RemoveProject extends RemoveProject {
  @override
  final ProjectModel project;

  factory _$RemoveProject([void Function(RemoveProjectBuilder)? updates]) =>
      (new RemoveProjectBuilder()..update(updates))._build();

  _$RemoveProject._({required this.project}) : super._() {
    BuiltValueNullFieldError.checkNotNull(project, r'RemoveProject', 'project');
  }

  @override
  RemoveProject rebuild(void Function(RemoveProjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveProjectBuilder toBuilder() => new RemoveProjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveProject && project == other.project;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, project.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RemoveProject')
          ..add('project', project))
        .toString();
  }
}

class RemoveProjectBuilder
    implements Builder<RemoveProject, RemoveProjectBuilder> {
  _$RemoveProject? _$v;

  ProjectModelBuilder? _project;
  ProjectModelBuilder get project =>
      _$this._project ??= new ProjectModelBuilder();
  set project(ProjectModelBuilder? project) => _$this._project = project;

  RemoveProjectBuilder();

  RemoveProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _project = $v.project.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoveProject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RemoveProject;
  }

  @override
  void update(void Function(RemoveProjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RemoveProject build() => _build();

  _$RemoveProject _build() {
    _$RemoveProject _$result;
    try {
      _$result = _$v ?? new _$RemoveProject._(project: project.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'project';
        project.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RemoveProject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EditProject extends EditProject {
  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String yotubeUrl;
  @override
  final File? image;

  factory _$EditProject([void Function(EditProjectBuilder)? updates]) =>
      (new EditProjectBuilder()..update(updates))._build();

  _$EditProject._(
      {required this.id,
      required this.title,
      required this.description,
      required this.yotubeUrl,
      this.image})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'EditProject', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'EditProject', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'EditProject', 'description');
    BuiltValueNullFieldError.checkNotNull(
        yotubeUrl, r'EditProject', 'yotubeUrl');
  }

  @override
  EditProject rebuild(void Function(EditProjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditProjectBuilder toBuilder() => new EditProjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditProject &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        yotubeUrl == other.yotubeUrl &&
        image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, yotubeUrl.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EditProject')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('yotubeUrl', yotubeUrl)
          ..add('image', image))
        .toString();
  }
}

class EditProjectBuilder implements Builder<EditProject, EditProjectBuilder> {
  _$EditProject? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _yotubeUrl;
  String? get yotubeUrl => _$this._yotubeUrl;
  set yotubeUrl(String? yotubeUrl) => _$this._yotubeUrl = yotubeUrl;

  File? _image;
  File? get image => _$this._image;
  set image(File? image) => _$this._image = image;

  EditProjectBuilder();

  EditProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _yotubeUrl = $v.yotubeUrl;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditProject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EditProject;
  }

  @override
  void update(void Function(EditProjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EditProject build() => _build();

  _$EditProject _build() {
    final _$result = _$v ??
        new _$EditProject._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'EditProject', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'EditProject', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'EditProject', 'description'),
            yotubeUrl: BuiltValueNullFieldError.checkNotNull(
                yotubeUrl, r'EditProject', 'yotubeUrl'),
            image: image);
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

class _$GetMyProjects extends GetMyProjects {
  factory _$GetMyProjects([void Function(GetMyProjectsBuilder)? updates]) =>
      (new GetMyProjectsBuilder()..update(updates))._build();

  _$GetMyProjects._() : super._();

  @override
  GetMyProjects rebuild(void Function(GetMyProjectsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetMyProjectsBuilder toBuilder() => new GetMyProjectsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetMyProjects;
  }

  @override
  int get hashCode {
    return 294727283;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetMyProjects').toString();
  }
}

class GetMyProjectsBuilder
    implements Builder<GetMyProjects, GetMyProjectsBuilder> {
  _$GetMyProjects? _$v;

  GetMyProjectsBuilder();

  @override
  void replace(GetMyProjects other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetMyProjects;
  }

  @override
  void update(void Function(GetMyProjectsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetMyProjects build() => _build();

  _$GetMyProjects _build() {
    final _$result = _$v ?? new _$GetMyProjects._();
    replace(_$result);
    return _$result;
  }
}

class _$GetNextMyProjects extends GetNextMyProjects {
  factory _$GetNextMyProjects(
          [void Function(GetNextMyProjectsBuilder)? updates]) =>
      (new GetNextMyProjectsBuilder()..update(updates))._build();

  _$GetNextMyProjects._() : super._();

  @override
  GetNextMyProjects rebuild(void Function(GetNextMyProjectsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetNextMyProjectsBuilder toBuilder() =>
      new GetNextMyProjectsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetNextMyProjects;
  }

  @override
  int get hashCode {
    return 890920092;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetNextMyProjects').toString();
  }
}

class GetNextMyProjectsBuilder
    implements Builder<GetNextMyProjects, GetNextMyProjectsBuilder> {
  _$GetNextMyProjects? _$v;

  GetNextMyProjectsBuilder();

  @override
  void replace(GetNextMyProjects other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetNextMyProjects;
  }

  @override
  void update(void Function(GetNextMyProjectsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetNextMyProjects build() => _build();

  _$GetNextMyProjects _build() {
    final _$result = _$v ?? new _$GetNextMyProjects._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
