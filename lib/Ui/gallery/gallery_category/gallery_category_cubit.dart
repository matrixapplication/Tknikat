import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taknikat/app/App.dart';
import 'package:taknikat/core/base_widget/base_toast.dart';
import '../../../data/repository/repository.dart';
import '../../../model/category_edit_param.dart';
import '../../../model/change_status_category_param.dart';
import '../../../model/gallery_params.dart';
import '../../../model/gallery_response.dart';
import '../../../model/search_user_response.dart';
import '../../../model/vendor_gallery_model.dart';
part 'gallery_category_state.dart';

class GalleryCategoryCubit extends Cubit<GalleryCategoryState> {
  GalleryCategoryCubit(this._repository) : super(GalleryInitial());
  Repository _repository;

  ///Gallery
  Future<void> addGallery(CategoryGalleryParams params,BuildContext context) async {
    emit(AddCategoryGalleryLoading());
    try {
      final res = await _repository.addCategoryGallery(params);
      if (res.statusCode == 200 || res.statusCode == 201) {
        // getGallery();
        navKey.currentContext!.read<GalleryCategoryCubit>().getCategoryGallery(isReload: true);
        pickUpImage(null);
        Navigator.pop(context);
        emit(AddCategoryGallerySuccess());
      } else {
        emit(AddCategoryGalleryError());
      }
    }
    on Exception catch (e) {
      emit(AddCategoryGalleryError());
    }
  }



  Future<void> editGallery(CategoryEditParam params,int id) async {
    print('editGalleryeditGallery');
    emit(EditCategoryGalleryLoading());
    try {
      final res = await _repository.editCategoryGallery(params,id);
      if (res.statusCode == 200 || res.statusCode == 201) {
        emit(EditCategoryGallerySuccess());
      } else {
        emit(EditCategoryGalleryError());
      }
    }
    on Exception catch (e) {
      emit(EditCategoryGalleryError());
    }finally{
      Navigator.pop(navKey.currentContext!);
    }
  }

  GalleryResponse? galleryResponse;
  bool isLoading = false;
  Future<void> getCategoryGallery({bool isReload = false}) async {
    isLoading=true;
    emit(GetCategoryGalleryLoading());
    try {
      if(isReload==true){
        galleryResponse=null;
        emit(GetCategoryGallerySuccess());
      }
      final currentPage =(galleryResponse?.paginator?.currentPage??0);
      final totalPage =(galleryResponse?.paginator?.totalPage??0);
      if (galleryResponse!=null &&(currentPage >= totalPage)) {
        emit(GetCategoryGallerySuccess());
        return null;
      }
      int page =(galleryResponse?.paginator?.currentPage??0)+1;
      final res = await _repository.getCategoryGallery(page);
      if(galleryResponse?.content != null){
        galleryResponse!.paginator =res.paginator;
        galleryResponse!.content!.addAll(res.content??[]);
      }else{
        galleryResponse =res;
      }
      isLoading=false;
      emit(GetCategoryGallerySuccess());
    }
    on Exception catch (e) {
      isLoading=false;
      emit(GetCategoryGalleryError());
    }finally{
      isLoading=false;
      emit(GetCategoryGalleryError());
    }
  }



  ///Search Users
  SearchUserResponse? searchUserResponse;
  List<SearchUserResponseContent> addSearchUserList=[];
  void addUser(SearchUserResponseContent user){
    addSearchUserList.add(user);
    emit(AddSearchState());
  }
  void removeUser(SearchUserResponseContent user){
    addSearchUserList.remove(user);
    emit(AddSearchState());
  }
  SearchUserResponse? searchUserResponseList;
  Future<void> searchUser({required String searchText}) async {
    emit(SearchUserLoading());
    try {
      final res = await _repository.searchUser(searchText);
      if(res.content != null){
        searchUserResponse=res;
      }
      emit(SearchUserSuccess());
    }
    on Exception catch (e) {
      emit(SearchUserError());
    }finally{
      isLoading=false;
      emit(SearchUserError());
    }
  }
  Future<void> searchUsersList({required List<int> userIds}) async {
    emit(SearchUserLoading());
    try {
      final res = await _repository.searchUsersList(userIds);
      if(res.content != null){
        searchUserResponseList=res;
        addSearchUserList=res.content??[];
      }
      emit(SearchUserSuccess());
    }
    on Exception catch (e) {
      emit(SearchUserError());
    }finally{
      isLoading=false;
      emit(SearchUserError());
    }
  }


  Future<void> deleteCategoryGallery(int id) async {
    emit(DeleteCategoryGalleryLoading());
    try {
      final res = await _repository.deleteCategoryGallery(id);
      if (res.statusCode == 200 || res.statusCode == 201) {
        emit(DeleteCategoryGallerySuccess());
      } else {
        showToast('${res.data['error_des']}');
        emit(DeleteCategoryGalleryError());
      }
    }
    on Exception catch (e) {
      showToast('${e.toString()}');
      emit(DeleteCategoryGalleryError());
    }finally{
      Navigator.pop(navKey.currentContext!);
    }
  }

  Future<void> changeHideCategoryGallery(ChangeStatusCategoryParam params) async {
    emit(HideCategoryGalleryLoading());
    try {
      final res = await _repository.changeHideCategoryGallery(params);
      if (res.statusCode == 200 || res.statusCode == 201) {
        emit(HideCategoryGallerySuccess());
      } else {
        emit(HideCategoryGalleryError());
      }
    }
    on Exception catch (e) {
      emit(HideCategoryGalleryError());
    }
    finally{
      Navigator.pop(navKey.currentContext!);
    }
  }



  File? imageCover;
  pickUpEditImage(File? cover){
    imageCover=cover;
    emit(PickUpEditImageState());
  }
  File? categoryCover;
  pickUpImage(File? cover){
    categoryCover=cover;
    emit(PickUpImageState());
  }
}
