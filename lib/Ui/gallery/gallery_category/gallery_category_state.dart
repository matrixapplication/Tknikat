part of 'gallery_category_cubit.dart';

@immutable
 class GalleryCategoryState {}

 class GalleryInitial extends GalleryCategoryState {}
 class GetCategoryGalleryLoading extends GalleryCategoryState {}
 class GetCategoryGallerySuccess extends GalleryCategoryState {}
 class GetCategoryGalleryError extends GalleryCategoryState {}
 class GetVendorGalleryLoading extends GalleryCategoryState {}

 class SearchUserLoading extends GalleryCategoryState {}
 class SearchUserSuccess extends GalleryCategoryState {}
 class SearchUserError extends GalleryCategoryState {}
 class AddSearchState extends GalleryCategoryState {}


class GetVendorGallerySuccess extends GalleryCategoryState {
 final   VendorGalleryModel? vendorGalleryResponse;
 GetVendorGallerySuccess({this.vendorGalleryResponse});
}
   class GetVendorGalleryError extends GalleryCategoryState {}
   class GetGalleryError extends GalleryCategoryState {}

 class AddCategoryGalleryLoading extends GalleryCategoryState {}
  class AddCategoryGallerySuccess extends GalleryCategoryState {}
  class AddCategoryGalleryError extends GalleryCategoryState {}

  class EditCategoryGalleryLoading extends GalleryCategoryState {}
   class EditCategoryGallerySuccess extends GalleryCategoryState {}
   class EditCategoryGalleryError extends GalleryCategoryState {}


 class DeleteCategoryGalleryLoading extends GalleryCategoryState {}
 class DeleteCategoryGallerySuccess extends GalleryCategoryState {}
 class DeleteCategoryGalleryError extends GalleryCategoryState {}


 class HideCategoryGalleryLoading extends GalleryCategoryState {}
  class HideCategoryGallerySuccess extends GalleryCategoryState {}
  class HideCategoryGalleryError extends GalleryCategoryState {}

  class PickUpImageState extends GalleryCategoryState {}
  class PickUpEditImageState extends GalleryCategoryState {}

