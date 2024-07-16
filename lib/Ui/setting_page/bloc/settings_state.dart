library settings_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/country/country_model.dart';
import 'package:taknikat/model/skill_model/skill_model.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'settings_state.g.dart';

abstract class SettingsState
    implements Built<SettingsState, SettingsStateBuilder> {
  // fields go here
  bool get initialized;

  String? get error;
  String get appLanguage;
  bool get isLoading;
  bool get logout;
  bool? get viewCart;

  bool get notification;
  bool get success;

  UserModel get user;
  BuiltList<Country> get countries;

  BuiltList<SkillModel> get skills;
  bool get isLogin;

  SettingsState._();

  factory SettingsState([updates(SettingsStateBuilder b)]) = _$SettingsState;

  factory SettingsState.initail() {
    return SettingsState((b) => b
      ..error = ""
      ..isLoading = false
      ..logout = false
      ..success = false
      ..user = null
      ..isLogin = false
      ..viewCart = false
      ..initialized = false
      ..appLanguage = 'en'
      ..notification = false);
  }
}
