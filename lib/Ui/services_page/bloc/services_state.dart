library services_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/service_model/service_model.dart';

part 'services_state.g.dart';

abstract class ServicesState
    implements Built<ServicesState, ServicesStateBuilder> {
  String? get error;
  bool get isLoading;

  BuiltList<ServiceModel> get services;

  Paginator get paginator;

  ServicesState._();

  factory ServicesState([updates(ServicesStateBuilder b)]) = _$ServicesState;

  factory ServicesState.initail() {
    return ServicesState((b) => b
      ..error = ""
      ..isLoading = false
      ..paginator = null
      ..services.replace([]));
  }
}
