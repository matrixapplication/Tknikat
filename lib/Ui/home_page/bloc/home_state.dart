library home_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/product_model/product_model.dart';
import 'package:taknikat/model/project_model/project_model.dart';
import 'package:taknikat/model/service_model/service_model.dart';
import 'package:taknikat/model/share_model/share_model.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  // fields go here

  String? get error;

  bool get isLoading;

  BuiltList<ProductModel> get newProducts;

  BuiltList<ServiceModel> get newServices;

  BuiltList<ProjectModel> get newProjects;

  BuiltList<ShareModel> get newShares;

  String? get aboutus;
  bool get success;
  bool get initialized;

  HomeState._();

  factory HomeState([updates(HomeStateBuilder b)]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState(
      (b) => b
        ..error = null
        ..isLoading = false
        ..success = false
        ..initialized = false
        ..newProducts.replace([])
        ..newProjects.replace([])
        ..newServices.replace([])
        ..newShares.replace([]),
    );
  }
}
