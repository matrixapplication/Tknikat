library settings_event;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'settings_event.g.dart';

abstract class SettingsEvent {}

abstract class InitSettings extends SettingsEvent
    implements Built<InitSettings, InitSettingsBuilder> {
  // fields go here

  InitSettings._();

  factory InitSettings([updates(InitSettingsBuilder b)]) = _$InitSettings;
}

abstract class ClearError extends SettingsEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetAppLanguage extends SettingsEvent
    implements Built<GetAppLanguage, GetAppLanguageBuilder> {
  GetAppLanguage._();

  factory GetAppLanguage([updates(GetAppLanguageBuilder b)]) = _$GetAppLanguage;
}

abstract class GetNotification extends SettingsEvent
    implements Built<GetNotification, GetNotificationBuilder> {
  GetNotification._();

  factory GetNotification([updates(GetNotificationBuilder b)]) =
      _$GetNotification;
}

abstract class ChangeStatus extends SettingsEvent
    implements Built<ChangeStatus, ChangeStatusBuilder> {
  // fields go here

  ChangeStatus._();

  factory ChangeStatus([updates(ChangeStatusBuilder b)]) = _$ChangeStatus;
}

abstract class GetUserData extends SettingsEvent
    implements Built<GetUserData, GetUserDataBuilder> {
  // fields go here

  GetUserData._();

  factory GetUserData([updates(GetUserDataBuilder b)]) = _$GetUserData;
}

abstract class GetIsLogin extends SettingsEvent
    implements Built<GetIsLogin, GetIsLoginBuilder> {
  // fields go here

  GetIsLogin._();

  factory GetIsLogin([updates(GetIsLoginBuilder b)]) = _$GetIsLogin;
}

abstract class SetNotification extends SettingsEvent
    implements Built<SetNotification, SetNotificationBuilder> {
  // fields go here

  bool get value;

  SetNotification._();

  factory SetNotification([updates(SetNotificationBuilder b)]) =
      _$SetNotification;
}
