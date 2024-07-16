library vendor_detail_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/product_model/product_model.dart';
import 'package:taknikat/model/project_model/project_model.dart';
import 'package:taknikat/model/serializer/serializer.dart';
import 'package:taknikat/model/service_model/service_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';

import '../post_model/post_model.dart';

part 'vendor_detail_model.g.dart';

abstract class VendorDetailModel
    implements Built<VendorDetailModel, VendorDetailModelBuilder> {
  @BuiltValueField(wireName: "products")
  BuiltList<ProductModel>? get vendorProducts;

  @BuiltValueField(wireName: "projects")
  BuiltList<ProjectModel>? get vendorProjects;

  @BuiltValueField(wireName: "services")
  BuiltList<ServiceModel>? get vendorServices;

  @BuiltValueField(wireName: "posts")
  BuiltList<PostModel>? get vendorPosts;

  @BuiltValueField(wireName: "shares")
  BuiltList<ShareModel>? get vendorShares;

  VendorDetailModel._();

  factory VendorDetailModel([updates(VendorDetailModelBuilder b)]) =
      _$VendorDetailModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(VendorDetailModel.serializer, this));
  }

  static VendorDetailModel fromJson(String jsonString) {
    return serializers.deserializeWith(
        VendorDetailModel.serializer, json.decode(jsonString))!;
  }

  static Serializer<VendorDetailModel> get serializer =>
      _$vendorDetailModelSerializer;
}
