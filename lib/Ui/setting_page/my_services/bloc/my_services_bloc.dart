import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'my_services_event.dart';
import 'my_services_state.dart';

class MyServicesBloc extends Bloc<MyServicesEvent, MyServicesState> {
  final Repository _repository;
  MyServicesBloc(this._repository) : super(MyServicesState.init()) {
    on<InitMyServices>((event, emit) async {
      try {
        final res = await _repository.getMyServices(1);
        emit(state.rebuild((b) => b
          ..initialized = true
          ..paginator.replace(res.paginator!)
          ..myServices.replace(res)));
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
    on<AddService>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..addSuccess = false));
      try {
        await _repository.addService(
            categoryId: event.categoryId,
            title: event.title,
            description: event.description,
            image: event.image,
            images: event.images,
            price: event.price);
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
    on<RemoveService>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..removeSuccess = false));
      try {
        await _repository.removeService(event.service);
        final res = await _repository.getMyServices(1);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..myServices.replace(res)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..removeSuccess = false
          ..error = e.error.toString()));
      }
    });
    on<EditService>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..editSuccess = false));
      try {
        await _repository.editService(
            id: event.id,
            categoryId: event.categoryId,
            title: event.title,
            description: event.description,
            image: event.image,
            images: event.images,
            price: event.price,
            deleteImages: event.deleteImages,
        );
        final res = await _repository.getMyServices(1);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..myServices.replace(res)
          ..paginator.replace(res.paginator!)
          ..editSuccess = true));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..editSuccess = false
          ..error = e.error.toString()));
      }
    });
    on<GetMyServices>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      try {
        final res = await _repository.getMyServices(1);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..paginator.replace(res.paginator!)
          ..myServices.replace(res)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
  }
}
