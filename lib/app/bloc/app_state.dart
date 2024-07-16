library app_state;

import 'package:built_value/built_value.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  // fields go here

  bool get loginState;

  String get appLanguage;
  bool get initialized;
  UserModel get user;

  AppState._();

  factory AppState([updates(AppStateBuilder b)]) = _$AppState;

  factory AppState.initail() {
    return AppState((b) => b
      ..loginState = false
      ..initialized = false
      ..user = null
      ..appLanguage = 'en');
  }
}
