import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'report_event.dart';
import 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  Repository _repository;

  ReportBloc(this._repository) : super(ReportState.initail()) {
    on<ClearError>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<GetReports>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..success = false
        ..error = ''));
      try {
        final data = await _repository.getReports();
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..success = true
          ..reports.replace(data)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..success = false
          ..error = e.error.toString()));
      }
    });
    on<AddReport>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..error = ''));
      try {
        await _repository.report(
          modelType: event.modelType,
          modelId: event.modelId,
          reportContent: event.reportId,
        );
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..isAddingReport = true
          //Todo
          ..error = ''
          ..success = true));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
  }
}
