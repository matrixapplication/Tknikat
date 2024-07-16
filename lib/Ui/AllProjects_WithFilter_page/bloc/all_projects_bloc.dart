import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'all_projects_event.dart';
import 'all_projects_state.dart';

class AllProjectsBloc extends Bloc<AllProjectsEvent, AllProjectsState> {
  Repository _repository;

  AllProjectsBloc(this._repository) : super(AllProjectsState.initail()) {
    on<ClearError>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<GetAllProjects>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..projects = null));

        final data = await _repository.getProjectByValue(
          pageId: 1,
          filters: event.customFilter,
        );

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..paginator.replace(data.paginator!)
          ..projects.replace(data.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
    on<GetNext>((event, emit) async {
      if (this.state.paginator.currentPage! < this.state.paginator.totalPage!) {
        try {
          emit(state.rebuild((b) => b..isLoading = true));
          final data = await _repository.getProjectByValue(
              pageId: this.state.paginator.currentPage! + 1,
              filters: event.customFilter);
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..projects.addAll(data.content!)
            ..paginator.replace(data.paginator!)));
        } on NetworkException catch (e) {
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..error = e.error.toString()));
        }
      }
    });
  }
}
