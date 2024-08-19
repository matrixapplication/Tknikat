library auth_state;

import 'package:built_value/built_value.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  // fields go here

  String? get error;
  String? get email;

  bool get isLoading;

  bool get success;
  bool get successSignup;
  bool get successComplete;
  bool get successVerfy;
  bool get successForget;

  UserModel get user;

  AuthState._();

  factory AuthState([updates(AuthStateBuilder b)]) = _$AuthState;

  factory AuthState.initail() {
    return AuthState((b) => b
      ..error = ""
      ..email = ""
      ..isLoading = false
      ..success = false
      ..successVerfy = false
      ..successSignup = false
      ..successComplete = false
      ..successForget = false
      ..user = null);
  }
}
