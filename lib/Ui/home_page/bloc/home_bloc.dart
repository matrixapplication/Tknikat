import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/core/mixin.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>
    with RetryBlocMixin<HomeEvent, HomeState> {
  Repository _repository;

  HomeBloc(this._repository) : super(HomeState.initial()) {
    on<ClearError>(
        (event, emit) => emit(state.rebuild((b) => b..error = null)));
    on<InitHome>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = null));

        final aboutusData = await _repository.getAboutus();
        final termsData = await _repository.getTerms();

        final recentProductsData =
            await _repository.getRetailsByCategory(null, page: 1);
        final recentProjectsData = await _repository.getAllProjects(1);
        final recentServicesData =
            await _repository.getServicesByCategory(null, page: 1);

        final recentSharesData = await _repository.getRecentlyShares();

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = null
          ..aboutus = aboutusData
          ..terms = termsData
          ..newProjects.replace(recentProjectsData.content!)
          ..newProducts.replace(recentProductsData.content!)
          ..newServices.replace(recentServicesData.content!)
          ..newShares.replace(recentSharesData.content!)
          ..initialized = true));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()
          ..initialized = true));
      }
    });
  }
}
