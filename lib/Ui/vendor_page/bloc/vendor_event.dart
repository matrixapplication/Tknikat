library vendor_event;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'vendor_event.g.dart';

abstract class VendorEvent {}

abstract class ClearError extends VendorEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetVendorData extends VendorEvent
    implements Built<GetVendorData, GetVendorDataBuilder> {
  UserModel get vendor;
  GetVendorData._();

  factory GetVendorData([updates(GetVendorDataBuilder b)]) = _$GetVendorData;
}

abstract class GetVendorEvents extends VendorEvent
    implements Built<GetVendorEvents, GetVendorEventsBuilder> {
  int get id;
  GetVendorEvents._();

  factory GetVendorEvents([updates(GetVendorEventsBuilder b)]) = _$GetVendorEvents;
}

