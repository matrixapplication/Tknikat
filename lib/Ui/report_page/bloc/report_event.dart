library report_event;


import 'package:built_value/built_value.dart';

part 'report_event.g.dart';

abstract class ReportEvent {}

abstract class ClearError extends ReportEvent
    implements Built<ClearError, ClearErrorBuilder> {
  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetReports extends ReportEvent
    implements Built<GetReports, GetReportsBuilder> {
  GetReports._();
  factory GetReports([updates(GetReportsBuilder b)]) = _$GetReports;
}

abstract class AddReport extends ReportEvent
    implements Built<AddReport, AddReportBuilder> {
  String get reportId;
  String get modelId;
  String get modelType;
  AddReport._();
  factory AddReport([updates(AddReportBuilder b)]) = _$AddReport;
}
