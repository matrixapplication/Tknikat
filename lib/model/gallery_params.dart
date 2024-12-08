import 'dart:io';

class GalleryParams {
  final bool? isHide;
  final String? categoryId;
  List<File>? files;

  GalleryParams({this.isHide, this.files, this.categoryId});

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

class CategoryGalleryParams {
  final bool? isHide;
  final String? title;
  final File? cover;

  CategoryGalleryParams({this.isHide, this.title,this.cover});

  Map<String, dynamic> toMap() {
    return {
      'is_hide': this.isHide,
      'title': this.title,
      'cover': this.cover,
    };
  }

  factory CategoryGalleryParams.fromMap(Map<String, dynamic> map) {
    return CategoryGalleryParams(
      isHide: map['is_hide'] as bool,
      cover: map['cover'] as File,
      title: map['title'] as String,
    );
  }
}