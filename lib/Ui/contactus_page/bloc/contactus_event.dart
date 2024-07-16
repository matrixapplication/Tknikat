library contactus_event;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'contactus_event.g.dart';

abstract class ContactusEvent {}

abstract class ContactUs extends ContactusEvent
    implements Built<ContactUs, ContactUsBuilder> {
  // fields go here

  String get name;

  String get mail;

  String get title;

  String get message;

  ContactUs._();

  factory ContactUs([updates(ContactUsBuilder b)]) = _$ContactUs;
}

abstract class Clear extends ContactusEvent
    implements Built<Clear, ClearBuilder> {
  // fields go here

  Clear._();

  factory Clear([updates(ClearBuilder b)]) = _$Clear;
}
