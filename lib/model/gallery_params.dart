import 'dart:io';

class GalleryParams {
  final bool? isHide;
  List<File>? files;

  GalleryParams({this.isHide, this.files,});

  Map<String, dynamic> toMap() {
    return {
      'is_hide': this.isHide,
      'images[]': this.files,
    };
  }

  factory GalleryParams.fromMap(Map<String, dynamic> map) {
    return GalleryParams(
      isHide: map['is_hide'] as bool,
      files: map['images[]'] as List<File>,
    );
  }
}