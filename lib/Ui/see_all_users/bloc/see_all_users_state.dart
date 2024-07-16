library see_all_users_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/paginator/paginator.dart';
import 'package:taknikat/model/user_model/user_model.dart';

part 'see_all_users_state.g.dart';

abstract class SeeAllUsersState
    implements Built<SeeAllUsersState, SeeAllUsersStateBuilder> {
  // fields go here

  String? get error;

  bool get isLoading;

  bool get success;

  BuiltList<UserModel> get users;

  Paginator get paginator;

  SeeAllUsersState._();

  factory SeeAllUsersState([updates(SeeAllUsersStateBuilder b)]) =
      _$SeeAllUsersState;

  factory SeeAllUsersState.initail() {
    return SeeAllUsersState((b) => b
      ..error = ""
      ..isLoading = true
      ..success = false
      ..users.replace([])
      ..paginator = null);
  }
}
