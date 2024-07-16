import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'my_events_event.dart';
import 'my_events_state.dart';

class MyEventsBloc extends Bloc<MyEventsEvent, MyEventsState> {
  final Repository _repository;
  MyEventsBloc(this._repository) : super(MyEventsState.init()) {
    on<InitMyEvents>((event, emit) async {
      try {
        final res = await _repository.getMyEvents(1);
        emit(state.rebuild((b) => b
          ..initialized = true
          // ..paginator.replace(res.paginator!)
          ..myEvents.replace(res)));
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
    on<RemoveEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..removeSuccess = false));
      try {
        await _repository.removeEvent(event.event);
        final res = await _repository.getMyEvents(1);

        emit(state.rebuild((b) => b
          ..isLoading = false
          // ..paginator.replace(res.paginator!)
          ..myEvents.replace(res)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..removeSuccess = false
          ..error = e.error.toString()));
      }
    });
    on<EditEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..editSuccess = false));
      try {
        await _repository.editEvent(event.param);

        final res = await _repository.getMyEvents(1);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..myEvents.replace(res)
          // ..paginator.replace(res.paginator!)
          ..editSuccess = true));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..editSuccess = false
          ..error = e.error.toString()));
      }
    });
    on<GetMyEvents>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      try {
        final res = await _repository.getMyEvents(1);
        emit(state.rebuild((b) => b
              ..isLoading = false
              ..myEvents.replace(res)
            // ..paginator.replace(res.paginator!)
            ));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
  }
}
