library app_event;

// import 'dart:convert';

// import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

// import 'package:built_value/serializer.dart';

part 'app_event.g.dart';

abstract class AppEvent {}
class SetNewLanguage extends AppEvent{
  String lang;
  SetNewLanguage(this.lang);
}

abstract class InitEvent extends AppEvent
    implements Built<InitEvent, InitEventBuilder> {
  // fields go here

  InitEvent._();

  factory InitEvent([updates(InitEventBuilder b)]) = _$InitEvent;
}

abstract class LogOutUser extends AppEvent
    implements Built<LogOutUser, LogOutUserBuilder> {
  // fields go here

  LogOutUser._();

  factory LogOutUser([updates(LogOutUserBuilder b)]) = _$LogOutUser;
}

abstract class DeleteAccount extends AppEvent
    implements Built<DeleteAccount, DeleteAccountBuilder> {
  // fields go here

  DeleteAccount._();

  factory DeleteAccount([updates(DeleteAccountBuilder b)]) = _$DeleteAccount;
}

abstract class ChangeAppCurrency extends AppEvent
    implements Built<ChangeAppCurrency, ChangeAppCurrencyBuilder> {
  ChangeAppCurrency._();
  String get appCurrency;

  factory ChangeAppCurrency([updates(ChangeAppCurrencyBuilder b)]) =
      _$ChangeAppCurrency;
}

abstract class ChangeAppLanguage extends AppEvent
    implements Built<ChangeAppLanguage, ChangeAppLanguageBuilder> {
  ChangeAppLanguage._();
  String get appLanguage;

  factory ChangeAppLanguage([updates(ChangeAppLanguageBuilder b)]) =
      _$ChangeAppLanguage;
}

abstract class GetAppLanguage extends AppEvent
    implements Built<GetAppLanguage, GetAppLanguageBuilder> {
  GetAppLanguage._();

  factory GetAppLanguage([updates(GetAppLanguageBuilder b)]) = _$GetAppLanguage;
}

abstract class GetCurrencyApp extends AppEvent
    implements Built<GetCurrencyApp, GetCurrencyAppBuilder> {
  GetCurrencyApp._();

  factory GetCurrencyApp([updates(GetCurrencyAppBuilder b)]) = _$GetCurrencyApp;
}

abstract class UpdateToken extends AppEvent
    implements Built<UpdateToken, UpdateTokenBuilder> {
  // fields go here

  String get firebase_token;

  UpdateToken._();

  factory UpdateToken([updates(UpdateTokenBuilder b)]) = _$UpdateToken;
}
