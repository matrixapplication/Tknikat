import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../app/App.dart';
import '../../../../core/app_localizations.dart';
import '../../../../core/base_widget/base_toast.dart';
import '../../../../data/repository/repository.dart';
import '../../../AllProducts_WithFilter_page/bloc/all_products_bloc.dart';
import '../../../AllServices_WithFilter_page/bloc/all_services_bloc.dart';
import '../../service_order/data/model/orders_service_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._repository) : super(ProductInitial());
  Repository _repository;

  bool isLoading=false;
  bool isServiceOrderLoading=false;
  bool isSuccess=false;
  void onUpdateIsSuccess(bool x ){
    isSuccess=x;
    print('asdasdasd ${isSuccess}');
    isLoading=false;
    emit(RequestProductLoading());

  }
  Future<void> requestProductOrder(String slug) async {
    isLoading=true;
    isSuccess=false;
    emit(RequestProductLoading());
    try {
      final res = await _repository.requestProductOrder(slug);
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();
        // navKey.currentContext!.read<GalleryCubit>().getGallery(params.categoryId??'0',isReload: true);
        isLoading=false;
        isSuccess=true;
        // navKey.currentContext!.pop();
        kSlugProductList.add(slug);
        // sl<AllServicesBloc>().add(GetAllServices((b) => b..customFilter = CustomFilter(
        //   search: ''
        // )));
        showToast(AppLocalizations.of(navKey.currentContext!).translate("booked successfully"));
        emit(RequestProductSuccess());
      }
      else {
        isLoading=false;

        emit(RequestProductError());
      }
    }
    on Exception catch (e) {
      isLoading=false;

      emit(RequestProductError());
    }
  }

  ServiceOrdersModel? serviceOrdersModel;
  Future<void> getMyProductOrders({required bool isProvider}) async {
    isServiceOrderLoading=true;
    serviceOrdersModel=null;
    emit(RequestProductLoading());
    try {
      final res = await _repository.getMyProductOrder(isProvider: isProvider);
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();

        serviceOrdersModel=res.data;
        // navKey.currentContext!.read<GalleryCubit>().getGallery(params.categoryId??'0',isReload: true);
        isServiceOrderLoading=false;
        emit(RequestProductSuccess());
      }
      else {
        isServiceOrderLoading=false;

        emit(RequestProductError());
      }
    }
    on Exception catch (e) {
      isServiceOrderLoading=false;

      emit(RequestProductError());
    }
  }
  bool? isLoadingStatus;
  bool? isAccepted;
  Future<void> changeStatusProductOrder({required bool isAccepted,required int id}) async {
    isLoadingStatus=true;
    this.isAccepted=isAccepted;
    emit(RequestProductLoading());
    try {
      final res = await _repository.changeStatusProductOrder( isAccepted: isAccepted, id: id, );
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();
        isLoadingStatus=false;
        showToast(res.statusMessage);
        getMyProductOrders(isProvider: true);
        // navKey.currentContext!.read<GalleryCubit>().getGallery(params.categoryId??'0',isReload: true);
        // emit(RequestProductSuccess());
      }
      else {
        isLoadingStatus=false;

        emit(RequestProductError());
      }
    }
    on Exception catch (e) {
      isLoadingStatus=false;

      emit(RequestProductError());
    }
  }

  Future<void> rateProductOrder({required String comment,required String rate,required int id}) async {
    emit(RequestProductLoading());
    try {
      final res = await _repository.rateProductOrder( id: id, comment: comment, rate: rate);
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();
        // navKey.currentContext!.read<GalleryCubit>().getGallery(params.categoryId??'0',isReload: true);
        emit(RequestProductSuccess());
      }
      else {
        emit(RequestProductError());
      }
    }
    on Exception catch (e) {
      emit(RequestProductError());
    }
  }
}
