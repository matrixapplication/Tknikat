class GalleryResponse {
  String? result;
  List<Content>? content;
  Paginator? paginator;
  String? errorDes;
  int? errorCode;
  String? imagesPrefix;

  GalleryResponse(
      {this.result,
        this.content,
        this.paginator,
        this.errorDes,
        this.errorCode,
        this.imagesPrefix});

  GalleryResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['content'] != null && json['content'] is List) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    paginator = json['paginator'] != null
        ? new Paginator.fromJson(json['paginator'])
        : null;
    errorDes = json['error_des'];
    errorCode = json['error_code'];
    imagesPrefix = json['images_prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.paginator != null) {
      data['paginator'] = this.paginator!.toJson();
    }
    data['error_des'] = this.errorDes;
    data['error_code'] = this.errorCode;
    data['images_prefix'] = this.imagesPrefix;
    return data;
  }
}

class Content {
  int? id;
  int? userId;
  String? image;
  String? cover;
  String? title;
  int? isHide;
  String? createdAt;
  String? updatedAt;

  Content(
      {this.id,
        this.userId,
        this.image,
        this.isHide,
        this.cover,
        this.title,
        this.createdAt,
        this.updatedAt});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    isHide = json['is_hide'];
    createdAt = json['created_at'];
    title = json['title'];
    cover = json['cover'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['image'] = this.image;
    data['is_hide'] = this.isHide;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['title'] = this.title;
    data['cover'] = this.cover;
    return data;
  }
}

class Paginator {
  int? totalCount;
  int? limit;
  int? totalPage;
  int? currentPage;

  Paginator({this.totalCount, this.limit, this.totalPage, this.currentPage});

  Paginator.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    limit = json['limit'];
    totalPage = json['total_page'];
    currentPage = json['current_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['limit'] = this.limit;
    data['total_page'] = this.totalPage;
    data['current_page'] = this.currentPage;
    return data;
  }
}
