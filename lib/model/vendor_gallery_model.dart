class VendorGalleryModel {
  VendorGalleryModelData? data;

  VendorGalleryModel({this.data});

  Map<String, dynamic> toMap() {
    return {
      'content': data?.toMap(),
    };
  }

  factory VendorGalleryModel.fromMap(Map<String, dynamic> map) {
    return VendorGalleryModel(
      data: VendorGalleryModelData.fromMap(map['content']),
    );
  }
}

class VendorGalleryModelData {

    List<VendorGalleryModelDataItem>? gallery;

  VendorGalleryModelData({this.gallery});

  Map<String, dynamic> toMap() {
    return {
      'gallery_categories': gallery?.map((e) => e.toMap()).toList(),
    };
  }

  factory VendorGalleryModelData.fromMap(Map<String, dynamic> map) {
    return VendorGalleryModelData(
      gallery: List<VendorGalleryModelDataItem>.from(
          map['gallery_categories']?.map((x) => VendorGalleryModelDataItem.fromMap(x))),
    );
  }
}
class VendorGalleryModelDataItem {
  int? id;
  int? userId;
  String? title;
  String? cover;
  String? image;
  int? isHide;
  String? createdAt;
  String? updatedAt;

  VendorGalleryModelDataItem(
      {this.id,
      this.userId,
      this.title,
      this.cover,
      this.image,
      this.isHide,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'user_id': this.userId,
      'image': this.image,
      'cover': this.cover,
      'title': this.title,
      'is_hide': this.isHide,
      'created_at': this.createdAt,
      'updated_at': this.updatedAt,
    };
  }

  factory VendorGalleryModelDataItem.fromMap(Map<String, dynamic> map) {
    return VendorGalleryModelDataItem(
      id: map['id'] as int?,
      userId: map['user_id'] as int?,
      image: map['image'] as String?,
      title: map['title'] as String?,
      cover: map['cover'] as String?,
      isHide: map['is_hide'] as int?,
      createdAt: map['created_at'] as String?,
      updatedAt: map['updated_at'] as String?,
    );
  }
}




