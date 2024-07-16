import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/event_model/event_model.dart';

part 'create_event_event.dart';
part 'create_event_state.dart';

class CreateEventBloc extends Bloc<CreateEventEvent, CreateEventState> {
  final _repository = sl<Repository>();

  CreateEventBloc() : super(CreateEventState()) {
    on<CreateEventEvent>((event, emit) async {
      if (event is ClearState) {
        emit(state.copyWith(event: null));
      }

      if (event is SubmitEvent) {
        emit(state.copyWith(isLoading: true, isSuccess: false, error: ''));
        try {
          await _repository.addEvent(event.param);
          emit(state.copyWith(isLoading: false, isSuccess: true));
        } on NetworkException catch (e) {
          emit(state.copyWith(isLoading: false, error: e.error.toString()));
        } catch (e) {
          emit(state.copyWith(isLoading: false, error: 'حدث خطأ ما'));
        }
        emit(state.copyWith(error: ''));
      }
    });
  }
}
