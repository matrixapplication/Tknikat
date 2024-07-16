library my_services_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/base_response/base_response.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/service_model/service_model.dart';

part 'my_services_state.g.dart';

abstract class MyServicesState
    implements Built<MyServicesState, MyServicesStateBuilder> {
  bool get isLoading;
  bool get addSuccess;
  bool get editSuccess;
  bool get removeSuccess;
  String? get error;

  BaseResponse<BuiltList<ServiceModel>> get myServices;

  Paginator get paginator;

  bool get initialized;

  MyServicesState._();

  factory MyServicesState([updates(MyServicesStateBuilder b)]) =
      _$MyServicesState;

  factory MyServicesState.init() {
    return MyServicesState((b) => b
      ..isLoading = false
      ..initialized = false
      ..addSuccess = false
      ..editSuccess = false
      ..removeSuccess = false
      ..error = '');
  }
}
