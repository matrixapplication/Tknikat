class ServiceOrdersModel {
  String? result;
  List<ServiceOrdersContent>? content;
  Paginator? paginator;
  String? errorDes;
  int? errorCode;
  String? imagesPrefix;

  ServiceOrdersModel(
      {this.result,
        this.content,
        this.paginator,
        this.errorDes,
        this.errorCode,
        this.imagesPrefix});

  ServiceOrdersModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['content'] != null) {
      content = <ServiceOrdersContent>[];
      json['content'].forEach((v) {
        content!.add(new ServiceOrdersContent.fromJson(v));
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

class ServiceOrdersContent {
  int? id;
  Status? status;
  int? price;
  int? adminPercent;
  int? adminAmount;
  int? totalPaid;
  Service? service;
  ServiceUser? serviceUser;
  ServiceUser? orderUser;
  dynamic rate;
  String? createdAt;

  ServiceOrdersContent(
      {this.id,
        this.status,
        this.price,
        this.adminPercent,
        this.adminAmount,
        this.totalPaid,
        this.service,
        this.serviceUser,
        this.orderUser,
        this.rate,
        this.createdAt});

  ServiceOrdersContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    price = json['price'];
    adminPercent = json['admin_percent'];
    adminAmount = json['admin_amount'];
    totalPaid = json['total_paid'];
    service =
    json['service'] != null ? new Service.fromJson(json['service']) :json['product'] != null ? new Service.fromJson(json['product']): null;
    serviceUser = json['service_user'] != null
        ? new ServiceUser.fromJson(json['service_user'])
        :json['product_user'] != null
        ? new ServiceUser.fromJson(json['product_user'])
        : null;
    orderUser = json['order_user'] != null
        ? new ServiceUser.fromJson(json['order_user'])
        : null;
    rate = json['rate'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['price'] = this.price;
    data['admin_percent'] = this.adminPercent;
    data['admin_amount'] = this.adminAmount;
    data['total_paid'] = this.totalPaid;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.serviceUser != null) {
      data['service_user'] = this.serviceUser!.toJson();
    }
    if (this.orderUser != null) {
      data['order_user'] = this.orderUser!.toJson();
    }
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Status {
  int? value;
  String? label;

  Status({this.value, this.label});

  Status.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['label'] = this.label;
    return data;
  }
}

class Service {
  int? id;
  String? slug;
  String? name;
  String? featuredImage;

  Service({this.id, this.slug, this.name, this.featuredImage});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    featuredImage = json['featured_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['featured_image'] = this.featuredImage;
    return data;
  }
}

class ServiceUser {
  int? id;
  String? name;

  ServiceUser({this.id, this.name});

  ServiceUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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
