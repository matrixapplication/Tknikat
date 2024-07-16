// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taknikat/Ui/AllRecentSharesWithFilter/bloc/state.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

class AllRecentSharesCubit extends Cubit<AllRecentSharesState> {
  final Repository repository;

  AllRecentSharesCubit(
    this.repository,
  ) : super(AllRecentSharesState());

  void loadPage(int page) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    try {
      final res = await repository.getAllRecentShares(page);
      final newShares = List.of(state.shares);
      newShares.addAll(res.content?.toList() ?? []);
      emit(state.copyWith(
        isLoading: false,
        currentPage: page,
        isLastPage: res.paginator!.isLastPage,
        shares: newShares,
      ));
    } on NetworkException catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.error,
      ));
    }
  }

  void search() {}
}
