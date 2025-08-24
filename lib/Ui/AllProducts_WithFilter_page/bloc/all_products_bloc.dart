import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'all_products_event.dart';
import 'all_products_state.dart';
List<String> kSlugProductList=[];

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  Repository _repository;

  AllProductsBloc(this._repository) : super(AllProductsState.initail()) {
    on<ClearError>(
      (_, emit) => emit(
        state.rebuild((b) => b..error = null),
      ),
    );
    on<GetAllProducts>((event, emit) async {
      print('GetAllProducts');
      try {
        kSlugProductList.clear();
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = null
          ..products = null));

        final data = await _repository.getProductByValue(
          pageId: 1,
          filters: event.customFilter,
        );

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = null
          ..paginator.replace(data.paginator!)
          ..products.replace(data.content!)));
      } on NetworkException catch (e, s) {
        print(s.toString());
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
    on<GetNext>((event, emit) async {
      if (this.state.paginator.currentPage! < this.state.paginator.totalPage!) {
        try {
          emit(state.rebuild((b) => b..isLoading = true));
          final data = await _repository.getProductByValue(
              pageId: this.state.paginator.currentPage! + 1,
              filters: event.customFilter);
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..products.addAll(data.content!)
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
