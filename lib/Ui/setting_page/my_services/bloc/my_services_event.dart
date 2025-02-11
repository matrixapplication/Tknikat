library my_services_event;

import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:taknikat/model/service_model/service_model.dart';

part 'my_services_event.g.dart';

abstract class MyServicesEvent {}

abstract class InitMyServices extends MyServicesEvent
    implements Built<InitMyServices, InitMyServicesBuilder> {
  InitMyServices._();
  factory InitMyServices([updates(InitMyServicesBuilder b)]) = _$InitMyServices;
}

abstract class AddService extends MyServicesEvent
    implements Built<AddService, AddServiceBuilder> {
  String get title;
  String get description;
  String get price;
  int get categoryId;
  // int get status;

  File? get image;

  List<File>? get images;
  AddService._();

  factory AddService([updates(AddServiceBuilder b)]) = _$AddService;
}

abstract class RemoveService extends MyServicesEvent
    implements Built<RemoveService, RemoveServiceBuilder> {
  ServiceModel get service;

  RemoveService._();

  factory RemoveService([updates(RemoveServiceBuilder b)]) = _$RemoveService;
}

abstract class EditService extends MyServicesEvent
    implements Built<EditService, EditServiceBuilder> {
  int get id;
  String get title;
  String get description;
  String get price;
  int get categoryId;
  // int get status;

  File? get image;

  List<File>? get images;

  EditService._();

  factory EditService([updates(EditServiceBuilder b)]) = _$EditService;
}

abstract class ClearState extends MyServicesEvent
    implements Built<ClearState, ClearStateBuilder> {
  ClearState._();

  factory ClearState([updates(ClearStateBuilder b)]) = _$ClearState;
}

abstract class GetMyServices extends MyServicesEvent
    implements Built<GetMyServices, GetMyServicesBuilder> {
  GetMyServices._();

  factory GetMyServices([updates(GetMyServicesBuilder b)]) = _$GetMyServices;
}
