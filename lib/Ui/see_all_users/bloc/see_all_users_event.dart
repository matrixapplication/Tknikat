library see_all_users_event;

import 'package:built_value/built_value.dart';

part 'see_all_users_event.g.dart';

abstract class SeeAllUsersEvent {}

abstract class ClearError extends SeeAllUsersEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class GetNextusers extends SeeAllUsersEvent
    implements Built<GetNextusers, GetNextusersBuilder> {
  GetNextusers._();
  //
  // int get skillId;

  factory GetNextusers([updates(GetNextusersBuilder b)]) = _$GetNextusers;
}

abstract class Getusers extends SeeAllUsersEvent
    implements Built<Getusers, GetusersBuilder> {
  //
  // int get skillId;
  Getusers._();

  factory Getusers([updates(GetusersBuilder b)]) = _$Getusers;
}
