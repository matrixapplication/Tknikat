library all_services_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/service_model/service_model.dart';

part 'all_services_state.g.dart';

abstract class AllServicesState
    implements Built<AllServicesState, AllServicesStateBuilder> {
  String? get error;
  bool get isLoading;

  BuiltList<ServiceModel> get services;

  Paginator get paginator;
  AllServicesState._();

  factory AllServicesState([updates(AllServicesStateBuilder b)]) =
      _$AllServicesState;

  factory AllServicesState.initail() {
    return AllServicesState((b) => b
      ..error = ""
      ..isLoading = false
      ..paginator = null
      ..services.replace([]));
  }
}
