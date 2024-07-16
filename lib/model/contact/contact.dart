library contact;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:taknikat/model/serializer/serializer.dart';

part 'contact.g.dart';

abstract class Contact implements Built<Contact, ContactBuilder> {
  // fields go here
  int get id;
  String? get name;
  String? get mail;
  String? get title;
  String? get message;
  Contact._();

  factory Contact([updates(ContactBuilder b)]) = _$Contact;

  String toJson() {
    return json.encode(serializers.serializeWith(Contact.serializer, this));
  }

  static Contact fromJson(String jsonString) {
    return serializers.deserializeWith(
        Contact.serializer, json.decode(jsonString))!;
  }

  static Serializer<Contact> get serializer => _$contactSerializer;
}
