import '../skill_model/skill_model.dart';

class UserCountryModel {
  List<UserCountryModelData>? userCountryModelData;

  UserCountryModel({this.userCountryModelData});

  UserCountryModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      userCountryModelData = <UserCountryModelData>[];
      json['content'].forEach((v) {
        userCountryModelData!.add(new UserCountryModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userCountryModelData != null) {
      data['content'] = this.userCountryModelData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserCountryModelData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? avatar;
  int? status;
  String? gender;
  String? createdAt;
  String? summary;
  String? facebook;
  String? youtube;
  String? instagram;
  String? linkedin;
  String? twitter;
  String? snapchat;
  int? cityId;
  String? whatsapp;
  int? isInfoCompleted;
  String? providerId;
  String? providerType;
  String? summaryRaw;
  int? countryId;
  CountryData? country;
  // List<SkillModel>? skills;
  City? city;

  UserCountryModelData(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.avatar,
        this.status,
        this.gender,
        this.createdAt,
        this.summary,
        this.facebook,
        this.youtube,
        this.instagram,
        this.linkedin,
        this.twitter,
        this.snapchat,
        this.cityId,
        this.whatsapp,
        this.isInfoCompleted,
        this.providerId,
        this.providerType,
        this.summaryRaw,
        this.countryId,
        this.country,
        // this.skills,
        this.city});

  UserCountryModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    avatar = json['avatar'];
    status = json['status'];
    gender = json['gender'];
    createdAt = json['created_at'];
    summary = json['summary'];
    facebook = json['facebook'];
    youtube = json['youtube'];
    instagram = json['instagram'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
    snapchat = json['snapchat'];
    cityId = json['city_id'];
    whatsapp = json['whatsapp'];
    isInfoCompleted = json['is_info_completed'];
    providerId = json['provider_id'];
    providerType = json['provider_type'];
    summaryRaw = json['summary_raw'];
    countryId = json['country_id'];
    // country =
    // json['country'] != null ? new CountryData.fromJson(json['country']) : null;
    // skills = json['skills'].cast<String>();
    // if (json['skills'] != null) {
    //   skills = <SkillModel>[];
    //   json['data'].forEach((v) {
    //     skills!.add(new SkillModel(v));
    //   });
    // }
    // city = json['city'] != null ? new City.fromJson(json['city']) : null;
    // Handle 'country' field
    if (json['country'] is Map<String, dynamic>) {
      country = CountryData.fromJson(json['country']);
    } else {
      country = null; // or handle the unexpected type/error case
    }

    // Handle 'city' field similarly
    if (json['city'] is Map<String, dynamic>) {
      city = City.fromJson(json['city']);
    } else {
      city = null; // or handle the unexpected type/error case
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['avatar'] = this.avatar;
    data['status'] = this.status;
    data['gender'] = this.gender;
    data['created_at'] = this.createdAt;
    data['summary'] = this.summary;
    data['facebook'] = this.facebook;
    data['youtube'] = this.youtube;
    data['instagram'] = this.instagram;
    data['linkedin'] = this.linkedin;
    data['twitter'] = this.twitter;
    data['snapchat'] = this.snapchat;
    data['city_id'] = this.cityId;
    data['whatsapp'] = this.whatsapp;
    data['is_info_completed'] = this.isInfoCompleted;
    data['provider_id'] = this.providerId;
    data['provider_type'] = this.providerType;
    data['summary_raw'] = this.summaryRaw;
    data['country_id'] = this.countryId;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    // data['skills'] = this.skills;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}

class CountryData {
  int? id;
  int? sortOrder;
  String? flag;
  String? name;

  CountryData({this.id, this.sortOrder, this.flag, this.name});

  CountryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sortOrder = json['sort_order'];
    flag = json['flag'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sort_order'] = this.sortOrder;
    data['flag'] = this.flag;
    data['name'] = this.name;
    return data;
  }
}

class City {
  int? id;
  int? sortOrder;
  int? countryId;
  String? name;
  CountryData? country;

  City({this.id, this.sortOrder, this.countryId, this.name, this.country});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sortOrder = json['sort_order'];
    countryId = json['country_id'];
    name = json['name'];
    country =
    json['country'] != null ? new CountryData.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sort_order'] = this.sortOrder;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}
