import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'filter_event.dart';
import 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  Repository _repository;

  FilterBloc(this._repository) : super(FilterState.initail()) {
    on<ClearError>(
        (event, emit) => emit(state.rebuild((b) => b..error = null)));
    on<GetFilterByCategory>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = null));

        final categories = await _repository.getCategories('product', 1);
        final countries = await _repository.getCountries();
        emit(state.rebuild(
          (b) => b
            ..isLoading = false
            ..error = null
            ..categories = categories.content!.toList()
            ..countries = countries.toList(),
        ));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
  }
}
