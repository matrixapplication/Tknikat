part of 'vendor_cubit.dart';

 class VendorState {}

 class VendorInitial extends VendorState {}
class GetVendorGalleryLoading extends VendorState {}
class GetVendorImagesLoading extends VendorState {}

class GetVendorGallerySuccess extends VendorState {
  final   VendorGalleryModel? vendorGalleryResponse;
  GetVendorGallerySuccess({this.vendorGalleryResponse});
}
class GetVendorGalleryError extends VendorState {}
class GetGalleryError extends VendorState {}

class GetVendorImagesSuccess extends VendorState {
  final   VendorImagesModel? vendorImagesModel;
  GetVendorImagesSuccess({this.vendorImagesModel});
}
class GetVendorImagesError extends VendorState {}
