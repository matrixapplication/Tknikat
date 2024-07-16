library edit_profile_state;

import 'package:built_value/built_value.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'edit_profile_state.g.dart';

abstract class EditProfileState
    implements Built<EditProfileState, EditProfileStateBuilder> {
  // fields go here

  String? get error;

  bool get isLoading;

  bool get isCompleted;
  bool get success;
  bool get successSignup;

  UserModel get data;

  EditProfileState._();

  factory EditProfileState([updates(EditProfileStateBuilder b)]) =
      _$EditProfileState;

  factory EditProfileState.initail() {
    return EditProfileState((b) => b
      ..error = ""
      ..isLoading = false
      ..isCompleted = false
      ..success = false
      ..successSignup = false
      ..data = null);
  }
}
