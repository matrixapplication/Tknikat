import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taknikat/app/App.dart';
import '../../../data/repository/repository.dart';
import '../../../model/gallery_params.dart';
import '../../../model/gallery_response.dart';
import '../../../model/vendor_gallery_model.dart';
part 'gallery_category_state.dart';

class GalleryCategoryCubit extends Cubit<GalleryCategoryState> {
  GalleryCategoryCubit(this._repository) : super(GalleryInitial());
  Repository _repository;

  Future<void> addGallery(CategoryGalleryParams params) async {
    emit(AddCategoryGalleryLoading());
    try {
      final res = await _repository.addCategoryGallery(params);
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();
        navKey.currentContext!.read<GalleryCategoryCubit>().getCategoryGallery();

        emit(AddCategoryGallerySuccess());
      } else {
        emit(AddCategoryGalleryError());
      }
    }
    on Exception catch (e) {
      emit(AddCategoryGalleryError());
    }
  }
  Future<void> editGallery(CategoryGalleryParams params,int id) async {
    emit(EditCategoryGalleryLoading());
    try {
      final res = await _repository.editCategoryGallery(params,id);
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();
        navKey.currentContext!.read<GalleryCategoryCubit>().getCategoryGallery();

        emit(EditCategoryGallerySuccess());
      } else {
        emit(EditCategoryGalleryError());
      }
    }
    on Exception catch (e) {
      emit(EditCategoryGalleryError());
    }
  }
  GalleryResponse? galleryResponse;
  Future<void> getCategoryGallery() async {
    emit(GetCategoryGalleryLoading());
    try {
      final res = await _repository.getCategoryGallery();
      galleryResponse = res;
      emit(GetCategoryGallerySuccess());
    }
    on Exception catch (e) {
      emit(GetCategoryGalleryError());
    }
  }



  Future<void> deleteCategoryGallery(int id) async {
    emit(DeleteCategoryGalleryLoading());
    try {
      final res = await _repository.deleteCategoryGallery(id);
      if (res.statusCode == 200 || res.statusCode == 201) {
        navKey.currentContext!.read<GalleryCategoryCubit>().getCategoryGallery();
        emit(DeleteCategoryGallerySuccess());
      } else {
        emit(DeleteCategoryGalleryError());
      }
    }
    on Exception catch (e) {
      emit(DeleteCategoryGalleryError());
    }
  }
  Future<void> changeHideCategoryGallery(int id) async {
    emit(HideCategoryGalleryLoading());
    try {
      final res = await _repository.changeHideCategoryGallery(id);
      if (res.statusCode == 200 || res.statusCode == 201) {
        navKey.currentContext!.read<GalleryCategoryCubit>().getCategoryGallery();
        emit(HideCategoryGallerySuccess());
      } else {
        emit(HideCategoryGalleryError());
      }
    }
    on Exception catch (e) {
      emit(HideCategoryGalleryError());
    }
  }

}
