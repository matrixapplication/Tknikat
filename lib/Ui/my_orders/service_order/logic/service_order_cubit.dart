import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taknikat/core/app_localizations.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';

import '../../../../app/App.dart';
import '../../../../data/repository/repository.dart';
import '../../../AllServices_WithFilter_page/bloc/all_services_bloc.dart';
import '../data/model/orders_service_model.dart';


part 'service_order_state.dart';

class ServiceOrderCubit extends Cubit<ServiceOrderState> {
  ServiceOrderCubit(this._repository) : super(ServiceOrderInitial());
  Repository _repository;

  bool isLoading=false;
  bool isServiceOrderLoading=false;
  bool isSuccess=false;
  void onUpdateIsSuccess(bool x ){
    isSuccess=x;
    isLoading=false;
    emit(RequestServiceOrderLoading());
  }
  Future<void> requestServiceOrder(String slug) async {
    isLoading=true;
    isSuccess=false;
    emit(RequestServiceOrderLoading());
    try {
      final res = await _repository.requestServiceOrder(slug);
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();
        // navKey.currentContext!.read<GalleryCubit>().getGallery(params.categoryId??'0',isReload: true);
        isLoading=false;
        isSuccess=true;
        // navKey.currentContext!.pop();
        kSlugList.add(slug);
        // sl<AllServicesBloc>().add(GetAllServices((b) => b..customFilter = CustomFilter(
        //   search: ''
        // )));
        showToast(AppLocalizations.of(navKey.currentContext!).translate("booked successfully"));
        emit(RequestServiceOrderSuccess());
      }
      else {
        isLoading=false;

        emit(RequestServiceOrderError());
      }
    }
    on Exception catch (e) {
      isLoading=false;

      emit(RequestServiceOrderError());
    }
  }

  ServiceOrdersModel? serviceOrdersModel;
  Future<void> getMyServiceOrder({required bool isProvider}) async {
    isServiceOrderLoading=true;
    serviceOrdersModel=null;
    emit(RequestServiceOrderLoading());
    try {
      final res = await _repository.getMyServiceOrder(isProvider:isProvider);
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();

        serviceOrdersModel=res.data;
        // navKey.currentContext!.read<GalleryCubit>().getGallery(params.categoryId??'0',isReload: true);
        isServiceOrderLoading=false;
        emit(RequestServiceOrderSuccess());
      }
      else {
        isServiceOrderLoading=false;

        emit(RequestServiceOrderError());
      }
    }
    on Exception catch (e) {
      isServiceOrderLoading=false;

      emit(RequestServiceOrderError());
    }
  }
  Future<void> rateServiceOrder({required String comment,required String rate,required int id}) async {
    emit(RequestServiceOrderLoading());
    try {
      final res = await _repository.rateServiceOrder( id: id, comment: comment, rate: rate);
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();
        // navKey.currentContext!.read<GalleryCubit>().getGallery(params.categoryId??'0',isReload: true);
        emit(RequestServiceOrderSuccess());
      }
      else {
        emit(RequestServiceOrderError());
      }
    }
    on Exception catch (e) {
      emit(RequestServiceOrderError());
    }
  }
  bool? isLoadingStatus;
  bool? isAccepted;
  Future<void> changeStatusServiceOrder({required bool isAccepted,required int id}) async {
    isLoadingStatus=true;
    this.isAccepted=isAccepted;
    emit(RequestServiceOrderLoading());
    try {
      final res = await _repository.changeStatusServiceOrder( isAccepted: isAccepted, id: id, );
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();
        isLoadingStatus=false;
        showToast(res.statusMessage);
        getMyServiceOrder(isProvider: true);
        // navKey.currentContext!.read<GalleryCubit>().getGallery(params.categoryId??'0',isReload: true);
        // emit(RequestProductSuccess());
      }
      else {
        isLoadingStatus=false;

        emit(RequestServiceOrderError());
      }
    }
    on Exception catch (e) {
      isLoadingStatus=false;

      emit(RequestServiceOrderError());
    }
  }

}
