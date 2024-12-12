part of 'gallery_cubit.dart';

@immutable
 class GalleryState {}

 class GalleryInitial extends GalleryState {}
 class GetGalleryLoading extends GalleryState {}

  class GetGallerySuccess extends GalleryState {
    GalleryResponse? galleryResponse;
 GetGallerySuccess({this.galleryResponse});
}


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
