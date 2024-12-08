import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taknikat/app/App.dart';

import '../../data/repository/repository.dart';
import '../../model/gallery_params.dart';
import '../../model/gallery_response.dart';
import '../../model/vendor_gallery_model.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit(this._repository) : super(GalleryInitial());
  Repository _repository;

  Future<void> addGallery(GalleryParams params) async {
    emit(AddImageLoading());
    try {
      final res = await _repository.addGallery(params);
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();
        navKey.currentContext!.read<GalleryCubit>().getGallery(params.categoryId??'0');
        emit(AddImageSuccess());
      } else {
        emit(AddImageError());
      }
    }
    on Exception catch (e) {
      emit(AddImageError());
    }
  }
  GalleryResponse? galleryResponse;
  Future<void> getGallery(String categoryId) async {
    emit(GetGalleryLoading());
    try {
      print('categoryId $categoryId');
      final res = await _repository.getGallery(categoryId);
      galleryResponse = res;
      emit(GetGallerySuccess(galleryResponse: galleryResponse));
    }
    on Exception catch (e) {
      emit(GetGalleryError());
    }
  }


  Future<void> deleteImage(int id,String categoryId) async {
    emit(DeleteImageLoading());
    try {
      final res = await _repository.deleteImage(id);
      if (res.statusCode == 200 || res.statusCode == 201) {
        navKey.currentContext!.read<GalleryCubit>().getGallery(categoryId);
        emit(DeleteImageSuccess());
      } else {
        emit(DeleteImageLoading());
      }
    }
    on Exception catch (e) {
      emit(DeleteImageLoading());
    }
  }
  Future<void> changeHideImage(int id,String categoryId) async {
    emit(HideImageLoading());
    try {
      final res = await _repository.changeHideImage(id);
      if (res.statusCode == 200 || res.statusCode == 201) {
        navKey.currentContext!.read<GalleryCubit>().getGallery(categoryId);
        emit(HideImageSuccess());
      } else {
        emit(HideImageError());
      }
    }
    on Exception catch (e) {
      emit(HideImageError());
    }
  }

}
