import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../app/App.dart';
import '../../../data/repository/repository.dart';

part 'service_order_state.dart';

class ServiceOrderCubit extends Cubit<ServiceOrderState> {
  ServiceOrderCubit(this._repository) : super(ServiceOrderInitial());
  Repository _repository;
  Future<void> requestServiceOrder() async {
    // emit(RequestServiceOrderLoading());
    // try {
    //   final res = await _repository.addGallery(params);
    //   if (res.statusCode == 200 || res.statusCode == 201) {
    //     // getGallery();
    //     // navKey.currentContext!.read<GalleryCubit>().getGallery(params.categoryId??'0',isReload: true);
    //     emit(RequestServiceOrderSuccess());
    //   } else {
    //     emit(RequestServiceOrderError());
    //   }
    // }
    // on Exception catch (e) {
    //   emit(AddImageError());
    // }
  }

}
