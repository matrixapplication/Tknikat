// user_model.dart

library user_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/injectoin.dart';
import 'package:taknikat/model/city/city.dart';
import 'package:taknikat/model/country/country_model.dart';
import 'package:taknikat/model/serializer/serializer.dart';
import 'package:taknikat/model/skill_model/skill_model.dart';

import '../perm_model.dart';

part 'user_model.g.dart';

abstract class UserModel implements Built<UserModel, UserModelBuilder> {
  int? get id;

  @BuiltValueField(wireName: "first_name")
  String? get firstName;

  @BuiltValueField(wireName: "last_name")
  String? get lastName;

  String? get email;

  @BuiltValueField(wireName: "phone_number")
  String? get phoneNumber;
  String? get address;
  @BuiltValueField(wireName: "birth_date")
  String? get birthDate;
  String? get avatar;

  String? get gender;

  @BuiltValueField(wireName: "city_id")
  int? get cityId;
  City? get city;
  @BuiltValueField(wireName: "is_info_completed")
  int? get isCompleted;
  @BuiltValueField(wireName: "country_id")
  int? get countryId;
  Country? get country;

  @BuiltValueField(wireName: "summary_raw")
  String? get summary;

  BuiltList<PermModel>? get perms;

  int? get isPhoneShow;
  int? get isEmailShow;
  int? get isFaceBookShow;
  int? get isLinkedInShow;
  int? get isInstagramShow;
  int? get isSnapchatShow;
  int? get isTwitterShow;
  int? get isYoutubeShow;
  int? get isWhatsappShow;

  String? get facebook;

  String? get youtube;

  String? get instagram;

  String? get linkedin;

  String? get twitter;

  String? get snapchat;

  String? get whatsapp;

  BuiltList<SkillModel>? get skills;

  @BuiltValueField(wireName: "firebase_token")
  String? get firebaseToken;

  @BuiltValueField(wireName: "created_at")
  String? get createdAt;

  UserModel._();

  factory UserModel([updates(UserModelBuilder b)]) = _$UserModel;

  String toJson() {
    return json.encode(serializers.serializeWith(UserModel.serializer, this));
  }

  static UserModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserModel.serializer, json.decode(jsonString))!;
  }

  @BuiltValueSerializer(custom: true)
  static Serializer<UserModel> get serializer => CustomUserModelSerializer();
}

extension UserExt on UserModel {
  bool get isMe => this.id == appUser?.id;
  // admin user does not have info more than id and email
  bool get isAdmin => this.firstName == null;
}

class CustomUserModelSerializer implements StructuredSerializer<UserModel> {
  @override
  final Iterable<Type> types = const [UserModel, _$UserModel];
  @override
  final String wireName = 'UserModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }

    value = object.isPhoneShow;
    if (value != null) {
      result
        ..add('is_phone_show')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(int)));
    }
    value = object.isEmailShow;
    if (value != null) {
      result
        ..add('is_email_show')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(int)));
    }
    value = object.isFaceBookShow;
    if (value != null) {
      result
        ..add('is_facebook_show')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(int)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.birthDate;
    if (value != null) {
      result
        ..add('birth_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }

    value = object.isLinkedInShow;
    if (value != null) {
      result
        ..add('is_linkedin_show')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(int)));
    }
    value = object.isInstagramShow;
    if (value != null) {
      result
        ..add('is_instagram_show')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(int)));
    }
    value = object.isSnapchatShow;
    if (value != null) {
      result
        ..add('is_snapchat_show')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(int)));
    }
    value = object.isTwitterShow;
    if (value != null) {
      result
        ..add('is_twitter_show')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(int)));
    }
    value = object.isYoutubeShow;
    if (value != null) {
      result
        ..add('is_youtube_show')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(int)));
    }
    value = object.isWhatsappShow;
      if (value != null) {
      result
        ..add('is_whatsapp_show')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(int)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }

    value = object.isCompleted;
    if (value != null) {
      result
        ..add('is_info_completed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(int)));
    }

    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cityId;
    if (value != null) {
      result
        ..add('city_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(City)));
    }
    value = object.countryId;
    if (value != null) {
      result
        ..add('country_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Country)));
    }
    value = object.summary;
    if (value != null) {
      result
        ..add('summary_raw')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.facebook;
    if (value != null) {
      result
        ..add('facebook')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.youtube;
    if (value != null) {
      result
        ..add('youtube')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.instagram;
    if (value != null) {
      result
        ..add('instagram')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.linkedin;
    if (value != null) {
      result
        ..add('linkedin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.twitter;
    if (value != null) {
      result
        ..add('twitter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.snapchat;
    if (value != null) {
      result
        ..add('snapchat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whatsapp;
    if (value != null) {
      result
        ..add('whatsapp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.skills;
    if (value != null) {
      result
        ..add('skills')
        ..add(serializers.serialize(value,
            specifiedType:
            const FullType(BuiltList, const [const FullType(SkillModel)])));
    }value = object.perms;
    if (value != null) {
      result
        ..add('perms')
        ..add(serializers.serialize(value,
            specifiedType:
            const FullType(BuiltList, const [const FullType(PermModel)])));
    }
    value = object.firebaseToken;
    if (value != null) {
      result
        ..add('firebase_token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_phone_show':
          result.isPhoneShow = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_email_show':
          result.isEmailShow = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_facebook_show':
          result.isFaceBookShow = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_linkedin_show':
          result.isLinkedInShow = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_instagram_show':
          result.isInstagramShow = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_snapchat_show':
          result.isSnapchatShow = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_twitter_show':
          result.isTwitterShow = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_youtube_show':
          result.isYoutubeShow = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'is_whatsapp_show':
          result.isWhatsappShow = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
          case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birth_date':
          result.birthDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_info_completed':
          result.isCompleted = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'city_id':
          result.cityId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'city':
          result.city.replace(serializers.deserialize(value,
              specifiedType: const FullType(City))! as City);
          break;
        case 'country_id':
          if (value is String) {
            if (value.isEmpty) value = null;
          }
          result.countryId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'country':
          result.country.replace(serializers.deserialize(value,
              specifiedType: const FullType(Country))! as Country);
          break;
        case 'summary_raw':
          result.summary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'facebook':
          result.facebook = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;

        case 'youtube':
          result.youtube = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'instagram':
          result.instagram = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'linkedin':
          result.linkedin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'twitter':
          result.twitter = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'snapchat':
          result.snapchat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'whatsapp':
          result.whatsapp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'skills':
          result.skills.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(SkillModel)]))!
          as BuiltList<Object?>);
          break;
          case 'perms':
          result.perms.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(PermModel)]))!
          as BuiltList<Object?>);
          break;
        case 'firebase_token':
          result.firebaseToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

