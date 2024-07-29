import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'my_projects_event.dart';
import 'my_projects_state.dart';

class MyProjectsBloc extends Bloc<MyProjectsEvent, MyProjectsState> {
  final Repository _repository;
  MyProjectsBloc(this._repository) : super(MyProjectsState.init()) {
    on<InitMyProjects>((event, emit) async {
      try {
        final res = await _repository.getMyProjects(1);
        emit(state.rebuild((b) => b
          ..initialized = true
          ..paginator.replace(res.paginator!)
          ..myProjects.replace(res.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..initialized = true
          ..error = e.error.toString()));
      }
    });
    on<ClearState>((event, emit) => emit(state.rebuild((b) => b
      ..error = ''
      ..addSuccess = false
      ..editSuccess = false
      ..removeSuccess = false)));
    on<AddProject>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..addSuccess = false));
      try {
        await _repository.addProject(
            event.title, event.description, event.yotubeUrl, event.image);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..addSuccess = true));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..addSuccess = false
          ..error = e.error.toString()));
      }
    });
    on<RemoveProject>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..removeSuccess = false));
      try {
        await _repository.removeProject(event.project);
        final res = await _repository.getMyProjects(1);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..paginator.replace(res.paginator!)
          ..myProjects.replace(res.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..removeSuccess = false
          ..error = e.error.toString()));
      }
    });
    on<EditProject>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..editSuccess = false));
      try {
        await _repository.editProject(event.id, event.title, event.description,
            event.yotubeUrl, event.image);
        final res = await _repository.getMyProjects(1);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..myProjects.replace(res.content!)
          ..paginator.replace(res.paginator!)
          ..editSuccess = true));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..editSuccess = false
          ..error = e.error.toString()));
      }
    });
    on<GetMyProjects>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      try {
        final res = await _repository.getMyProjects(1);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..myProjects.replace(res.content!)
          ..paginator.replace(res.paginator!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
  }
}
