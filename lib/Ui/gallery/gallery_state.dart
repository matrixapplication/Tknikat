part of 'gallery_cubit.dart';

@immutable
 class GalleryState {}

 class GalleryInitial extends GalleryState {}
 class GetGalleryLoading extends GalleryState {}
 class GetVendorGalleryLoading extends GalleryState {}

  class GetGallerySuccess extends GalleryState {
 final   GalleryResponse? galleryResponse;
 GetGallerySuccess({this.galleryResponse});
}

class GetVendorGallerySuccess extends GalleryState {
 final   VendorGalleryModel? vendorGalleryResponse;
 GetVendorGallerySuccess({this.vendorGalleryResponse});
}
   class GetVendorGalleryError extends GalleryState {}
   class GetGalleryError extends GalleryState {}
 class AddImageLoading extends GalleryState {}
 class AddImageSuccess extends GalleryState {}
 class AddImageError extends GalleryState {}

 class DeleteImageError extends GalleryState {}
 class DeleteImageSuccess extends GalleryState {}
 class DeleteImageLoading extends GalleryState {}

 class HideImageLoading extends GalleryState {}
 class HideImageSuccess extends GalleryState {}
 class HideImageError extends GalleryState {}
