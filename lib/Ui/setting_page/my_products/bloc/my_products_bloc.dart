import 'package:bloc/bloc.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';

import 'my_products_event.dart';
import 'my_products_state.dart';

class MyProductsBloc extends Bloc<MyProductsEvent, MyProductsState> {
  final Repository _repository;
  MyProductsBloc(this._repository) : super(MyProductsState.init()) {
    on<InitMyProducts>((event, emit) async {
      try {
        final res = await _repository.getMyProducts(1);
        emit(state.rebuild((b) => b
          ..initialized = true
          ..paginator.replace(res.paginator!)
          ..myProducts.replace(res.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..initialized = true
          ..error = e.error.toString()));
      }
    });
    on<ClearState>(
      (event, emit) => emit(state.rebuild((b) => b
        ..error = ''
        ..addSuccess = false
        ..editSuccess = false
        ..removeSuccess = false)),
    );
    on<AddProduct>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..addSuccess = false));
      try {
        await _repository.addProduct(
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
    on<RemoveProduct>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..removeSuccess = false));
      try {
        await _repository.removeProduct(event.product);
        final res = await _repository.getMyProducts(1);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..paginator.replace(res.paginator!)
          ..myProducts.replace(res.content!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..removeSuccess = false
          ..error = e.error.toString()));
      }
    });
    on<EditProduct>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..editSuccess = false));
      try {
        await _repository.editProduct(
            id: event.id,
            categoryId: event.categoryId,
            title: event.title,
            description: event.description,
            image: event.image,
            images: event.images,
            price: event.price);
        final res = await _repository.getMyProducts(1);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..myProducts.replace(res.content!)
          ..paginator.replace(res.paginator!)
          ..editSuccess = true));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..editSuccess = false
          ..error = e.error.toString()));
      }
    });
    on<GetMyProducts>((event, emit) async {
      emit(state.rebuild((b) => b..isLoading = true));
      try {
        final res = await _repository.getMyProducts(1);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..myProducts.replace(res.content!)
          ..paginator.replace(res.paginator!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
  }
}
