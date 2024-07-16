// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_event.dart';

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

class _$GetReports extends GetReports {
  factory _$GetReports([void Function(GetReportsBuilder)? updates]) =>
      (new GetReportsBuilder()..update(updates))._build();

  _$GetReports._() : super._();

  @override
  GetReports rebuild(void Function(GetReportsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetReportsBuilder toBuilder() => new GetReportsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetReports;
  }

  @override
  int get hashCode {
    return 62652247;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GetReports').toString();
  }
}

class GetReportsBuilder implements Builder<GetReports, GetReportsBuilder> {
  _$GetReports? _$v;

  GetReportsBuilder();

  @override
  void replace(GetReports other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetReports;
  }

  @override
  void update(void Function(GetReportsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetReports build() => _build();

  _$GetReports _build() {
    final _$result = _$v ?? new _$GetReports._();
    replace(_$result);
    return _$result;
  }
}

class _$AddReport extends AddReport {
  @override
  final String reportId;
  @override
  final String modelId;
  @override
  final String modelType;

  factory _$AddReport([void Function(AddReportBuilder)? updates]) =>
      (new AddReportBuilder()..update(updates))._build();

  _$AddReport._(
      {required this.reportId, required this.modelId, required this.modelType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(reportId, r'AddReport', 'reportId');
    BuiltValueNullFieldError.checkNotNull(modelId, r'AddReport', 'modelId');
    BuiltValueNullFieldError.checkNotNull(modelType, r'AddReport', 'modelType');
  }

  @override
  AddReport rebuild(void Function(AddReportBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddReportBuilder toBuilder() => new AddReportBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddReport &&
        reportId == other.reportId &&
        modelId == other.modelId &&
        modelType == other.modelType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reportId.hashCode);
    _$hash = $jc(_$hash, modelId.hashCode);
    _$hash = $jc(_$hash, modelType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddReport')
          ..add('reportId', reportId)
          ..add('modelId', modelId)
          ..add('modelType', modelType))
        .toString();
  }
}

class AddReportBuilder implements Builder<AddReport, AddReportBuilder> {
  _$AddReport? _$v;

  String? _reportId;
  String? get reportId => _$this._reportId;
  set reportId(String? reportId) => _$this._reportId = reportId;

  String? _modelId;
  String? get modelId => _$this._modelId;
  set modelId(String? modelId) => _$this._modelId = modelId;

  String? _modelType;
  String? get modelType => _$this._modelType;
  set modelType(String? modelType) => _$this._modelType = modelType;

  AddReportBuilder();

  AddReportBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reportId = $v.reportId;
      _modelId = $v.modelId;
      _modelType = $v.modelType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddReport other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddReport;
  }

  @override
  void update(void Function(AddReportBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddReport build() => _build();

  _$AddReport _build() {
    final _$result = _$v ??
        new _$AddReport._(
            reportId: BuiltValueNullFieldError.checkNotNull(
                reportId, r'AddReport', 'reportId'),
            modelId: BuiltValueNullFieldError.checkNotNull(
                modelId, r'AddReport', 'modelId'),
            modelType: BuiltValueNullFieldError.checkNotNull(
                modelType, r'AddReport', 'modelType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
