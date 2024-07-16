import 'package:bloc/bloc.dart';
import 'package:taknikat/Ui/services_page/bloc/services_event.dart';
import 'package:taknikat/Ui/services_page/bloc/services_state.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

class ServicesBloc extends Bloc<EventsEvent, ServicesState> {
  Repository _repository;

  ServicesBloc(this._repository) : super(ServicesState.initail()) {
    on<ClearError>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<GetCategoryServices>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..paginator = null
          ..services.replace([])));

        final categoriesData =
            await _repository.getServicesByCategory(event.categoryId, page: 1);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..paginator.replace(categoriesData.paginator!)
          ..services.replace(categoriesData.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()
          ..services.replace([])));
      }
    });
    on<GetNext>((event, emit) async {
      if (this.state.paginator.currentPage! < this.state.paginator.totalPage!) {
        try {
          emit(state.rebuild((b) => b..isLoading = true));
          final data = await _repository.getServicesByCategory(event.categoryId,
              page: this.state.paginator.currentPage! + 1);
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..paginator.replace(data.paginator!)
            ..services.addAll(data.content!)));
        } on NetworkException catch (e) {
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..error = e.error.toString()));
        }
      }
    });
  }
}
