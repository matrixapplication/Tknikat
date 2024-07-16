import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'all_categories_event.dart';
import 'all_categories_state.dart';

class AllCategoriesBloc extends Bloc<AllCategoriesEvent, AllCategoriesState> {
  Repository _repository;

  AllCategoriesBloc(this._repository) : super(AllCategoriesState.initail()) {
    on<ClearError>((event, emit) {
      emit(state.rebuild((b) => b..error = ""));
    });
    on<InitCategories>((event, emit) async {
      try {
        emit(
          state.rebuild(
            (b) => b
              ..isLoading = true
              ..error = "",
          ),
        );
        final productCategoryData =
            await _repository.getCategories('product', 1);
        final serviceCategoryData =
            await _repository.getCategories('service', 1);

        var projectsEvents = await _repository.getAllEvents(
          null,
          page: 1,
        );
        final lastPage = projectsEvents.paginator!.totalPage ?? 2 - 1;
        projectsEvents = await _repository.getAllEvents(
          null,
          page: lastPage,
        );
        emit(
          state.rebuild(
            (b) => b
              ..isLoading = false
              ..error = ""
              ..productsCategories.replace(productCategoryData.content!)
              ..servicesCategories.replace(serviceCategoryData.content!)
              ..projectsEvents.replace(projectsEvents.content!.reversed)
              ..initialized = true,
          ),
        );
      } on NetworkException catch (e) {
        emit(
          state.rebuild((b) => b
            ..isLoading = false
            ..error = e.error.toString()
            ..initialized = true),
        );
      }
    });
    on<GetCategories>((event, emit) async {
      try {
        emit(state.rebuild((b) => b..isLoading = true));

        final serviceCategoryData =
            await _repository.getCategories('service', 1);
        final projectsCategories =
            await _repository.getCategories('project', 1);
        emit(
          state.rebuild((b) => b
            ..projectsCategories.replace(projectsCategories.content!)
            ..servicesCategories.replace(serviceCategoryData.content!)
            ..isLoading = false),
        );
      } on NetworkException catch (e) {
        emit(
          state.rebuild(
            (b) => b
              ..isLoading = false
              ..error = e.error.toString(),
          ),
        );
      }
    });
  }
}
