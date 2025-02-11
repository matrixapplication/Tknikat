import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/repository.dart';
import '../../../model/vendor_gallery_model.dart';
import '../../../model/vendor_images_model.dart';

part 'vendor_state.dart';

class VendorCubit extends Cubit<VendorState> {
  Repository _repository;
  VendorCubit(this._repository) : super(VendorInitial());

  VendorGalleryModel? vendorGalleryResponse;
  Future<void> getVendorGallery({required int vendorId}) async {
    emit(GetVendorGalleryLoading());
    try {
      print('sadsadsadsad $vendorId');
      final res = await _repository.getVendorGallery(vendorId: vendorId);
      vendorGalleryResponse = res;
      print('sadsadsadsad ${vendorGalleryResponse?.data?.gallery?.length}');
      emit(GetVendorGallerySuccess(vendorGalleryResponse: vendorGalleryResponse));
    }
    on Exception catch (e) {
      emit(GetVendorGalleryError());
    }
  }


  VendorImagesModel? vendorImagesResponse;
  Future<void> getVendorImages({required int categoryId}) async {
    emit(GetVendorImagesLoading());
    try {
      print('sadsadsadsad $categoryId');
      final res = await _repository.getVendorImages(categoryId: categoryId);
      vendorImagesResponse = res;
      print('sadsadsadsad ${vendorImagesResponse?.data?.gallery?.length}');
      emit(GetVendorImagesSuccess(vendorImagesModel: vendorImagesResponse));
    }
    on Exception catch (e) {
      emit(GetVendorImagesError());
    }
  }

}
