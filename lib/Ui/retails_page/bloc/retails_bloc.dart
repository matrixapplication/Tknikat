import 'package:bloc/bloc.dart';
import 'package:taknikat/Ui/retails_page/bloc/retails_event.dart';
import 'package:taknikat/Ui/retails_page/bloc/retails_state.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

class RetailsBloc extends Bloc<RetailsEvent, RetailsState> {
  Repository _repository;

  RetailsBloc(this._repository) : super(RetailsState.initail()) {
    on((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<GetCategoryRetails>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..paginator = null
          ..retails.replace([])));

        final categoriesData =
            await _repository.getRetailsByCategory(event.categoryId, page: 1);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..paginator.replace(categoriesData.paginator!)
          ..retails.replace(categoriesData.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()
          ..retails.replace([])));
      }
    });
    on<GetNext>((event, emit) async {
      if (this.state.paginator.currentPage! < this.state.paginator.totalPage!) {
        try {
          emit(state.rebuild((b) => b..isLoading = true));
          final data = await _repository.getRetailsByCategory(event.categoryId,
              page: this.state.paginator.currentPage! + 1);
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..paginator.replace(data.paginator!)
            ..retails.addAll(data.content!)));
        } on NetworkException catch (e) {
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..error = e.error.toString()));
        }
      }
    });
  }
}
