import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'all_services_event.dart';
import 'all_services_state.dart';

class AllServicesBloc extends Bloc<AllServicesEvent, AllServicesState> {
  Repository _repository;

  AllServicesBloc(this._repository) : super(AllServicesState.initail()) {
    on<ClearError>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<GetAllServices>((event, emit) async {
      try {
        print("GetAllServices");
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..services = null));

        final data = await _repository.getServiceByValue(
          pageId: 1,
          filters: event.customFilter,
        );
        print("GetAllServices data ${data.content?.length}");

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..paginator.replace(data.paginator!)
          ..services.replace(data.content!)));
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
          final data = await _repository.getServiceByValue(
              pageId: this.state.paginator.currentPage! + 1,
              filters: event.customFilter);
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..services.addAll(data.content!)
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
