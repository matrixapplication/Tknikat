// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportState extends ReportState {
  @override
  final String? error;
  @override
  final bool success;
  @override
  final BuiltList<ReportModel> reports;
  @override
  final Paginator paginator;
  @override
  final bool isLoading;
  @override
  final bool isAddingReport;

  factory _$ReportState([void Function(ReportStateBuilder)? updates]) =>
      (new ReportStateBuilder()..update(updates))._build();

  _$ReportState._(
      {this.error,
      required this.success,
      required this.reports,
      required this.paginator,
      required this.isLoading,
      required this.isAddingReport})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(success, r'ReportState', 'success');
    BuiltValueNullFieldError.checkNotNull(reports, r'ReportState', 'reports');
    BuiltValueNullFieldError.checkNotNull(
        paginator, r'ReportState', 'paginator');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'ReportState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isAddingReport, r'ReportState', 'isAddingReport');
  }

  @override
  ReportState rebuild(void Function(ReportStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportStateBuilder toBuilder() => new ReportStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportState &&
        error == other.error &&
        success == other.success &&
        reports == other.reports &&
        paginator == other.paginator &&
        isLoading == other.isLoading &&
        isAddingReport == other.isAddingReport;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, reports.hashCode);
    _$hash = $jc(_$hash, paginator.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isAddingReport.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportState')
          ..add('error', error)
          ..add('success', success)
          ..add('reports', reports)
          ..add('paginator', paginator)
          ..add('isLoading', isLoading)
          ..add('isAddingReport', isAddingReport))
        .toString();
  }
}

class ReportStateBuilder implements Builder<ReportState, ReportStateBuilder> {
  _$ReportState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  ListBuilder<ReportModel>? _reports;
  ListBuilder<ReportModel> get reports =>
      _$this._reports ??= new ListBuilder<ReportModel>();
  set reports(ListBuilder<ReportModel>? reports) => _$this._reports = reports;

  PaginatorBuilder? _paginator;
  PaginatorBuilder get paginator =>
      _$this._paginator ??= new PaginatorBuilder();
  set paginator(PaginatorBuilder? paginator) => _$this._paginator = paginator;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isAddingReport;
  bool? get isAddingReport => _$this._isAddingReport;
  set isAddingReport(bool? isAddingReport) =>
      _$this._isAddingReport = isAddingReport;

  ReportStateBuilder();

  ReportStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _success = $v.success;
      _reports = $v.reports.toBuilder();
      _paginator = $v.paginator.toBuilder();
      _isLoading = $v.isLoading;
      _isAddingReport = $v.isAddingReport;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportState;
  }

  @override
  void update(void Function(ReportStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportState build() => _build();

  _$ReportState _build() {
    _$ReportState _$result;
    try {
      _$result = _$v ??
          new _$ReportState._(
              error: error,
              success: BuiltValueNullFieldError.checkNotNull(
                  success, r'ReportState', 'success'),
              reports: reports.build(),
              paginator: paginator.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'ReportState', 'isLoading'),
              isAddingReport: BuiltValueNullFieldError.checkNotNull(
                  isAddingReport, r'ReportState', 'isAddingReport'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'reports';
        reports.build();
        _$failedField = 'paginator';
        paginator.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReportState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
