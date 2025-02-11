class VendorImagesModel {
  VendorImagesModelModelData? data;

  VendorImagesModel({this.data});

  Map<String, dynamic> toMap() {
    return {
      'content': data?.toMap(),
    };
  }

  factory VendorImagesModel.fromMap(Map<String, dynamic> map) {
    return VendorImagesModel(
      data: VendorImagesModelModelData.fromMap(map['content']),
    );
  }
}

class VendorImagesModelModelData {

    List<VendorImagesModelDataItem>? gallery;

    VendorImagesModelModelData({this.gallery});

  Map<String, dynamic> toMap() {
    return {
      'data': gallery?.map((e) => e.toMap()).toList(),
    };
  }

  factory VendorImagesModelModelData.fromMap(Map<String, dynamic> map) {
    return VendorImagesModelModelData(
      gallery: List<VendorImagesModelDataItem>.from(
          map['data']?.map((x) => VendorImagesModelDataItem.fromMap(x))),
    );
  }
}
class VendorImagesModelDataItem {
  int? id;
  int? userId;
  String? title;
  String? cover;
  String? image;
  int? isHide;
  String? createdAt;
  String? updatedAt;

  VendorImagesModelDataItem(
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

  factory VendorImagesModelDataItem.fromMap(Map<String, dynamic> map) {
    return VendorImagesModelDataItem(
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




