library report_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/report_model/report_model.dart';

part 'report_state.g.dart';

abstract class ReportState implements Built<ReportState, ReportStateBuilder> {
  String? get error;
  bool get success;

  BuiltList<ReportModel> get reports;

  Paginator get paginator;

  bool get isLoading;
  bool get isAddingReport;
  ReportState._();

  factory ReportState([updates(ReportStateBuilder b)]) = _$ReportState;

  factory ReportState.initail() {
    return ReportState((b) => b
      ..error = ""
      ..success = false
      ..isLoading = false
      ..isAddingReport = false);
  }
}
