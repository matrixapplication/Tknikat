library vendor_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/event_model/event_model.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/post_model/post_model.dart';
import 'package:taknikat/model/product_model/product_model.dart';
import 'package:taknikat/model/project_model/project_model.dart';
import 'package:taknikat/model/service_model/service_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'vendor_state.g.dart';

abstract class VendorState implements Built<VendorState, VendorStateBuilder> {
  // fields go here
  String? get error;

  bool get isLoading;

  bool get success;

  UserModel get vendor;

  BuiltList<ProductModel> get products;

  BuiltList<ProjectModel> get projects;

  BuiltList<ServiceModel> get services;

  BuiltList<ShareModel> get shares;
  BuiltList<EventModel> get events;

  Paginator get postsPaginator;

  bool get initialized;
  VendorState._();

  factory VendorState([updates(VendorStateBuilder b)]) = _$VendorState;

  factory VendorState.initail() {
    return VendorState((b) => b
      ..error = ""
      ..isLoading = false
      ..initialized = false
      ..success = false);
  }
}
