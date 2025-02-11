library edit_profile_event;

import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:taknikat/model/skill_model/skill_model.dart';

import '../../../../model/change_personal_status_model.dart';

part 'edit_profile_event.g.dart';

abstract class EditProfileEvent {}

abstract class TryLogin extends EditProfileEvent
    implements Built<TryLogin, TryLoginBuilder> {
  // fields go here

  String get mobile;

  String get password;

  TryLogin._();

  factory TryLogin([updates(TryLoginBuilder b)]) = _$TryLogin;
}

abstract class ClearState extends EditProfileEvent
    implements Built<ClearState, ClearStateBuilder> {
  // fields go here

  ClearState._();

  factory ClearState([updates(ClearStateBuilder b)]) = _$ClearState;
}

abstract class ChangeStatus extends EditProfileEvent
    implements Built<ChangeStatus, ChangeStatusBuilder> {
  // fields go here

  ChangeStatus._();

  factory ChangeStatus([updates(ChangeStatusBuilder b)]) = _$ChangeStatus;
}

abstract class GetProfile extends EditProfileEvent
    implements Built<GetProfile, GetProfileBuilder> {
  // fields go here
  //  BuildContext get context ;

  GetProfile._();

  factory GetProfile([updates(GetProfileBuilder b)]) = _$GetProfile;
}


abstract class ChangePersonalStatus extends EditProfileEvent
    implements Built<ChangePersonalStatus, ChangePersonalStatusBuilder> {
  // fields go here
  //  BuildContext get context ;
  // ChangeStatusParams get params;
  String get keyValue;
  String get statusValue;
  ChangePersonalStatus._();

  factory ChangePersonalStatus([updates(ChangePersonalStatusBuilder b)]) = _$ChangePersonalStatus;
}



abstract class ForgotPassword extends EditProfileEvent
    implements Built<ForgotPassword, ForgotPasswordBuilder> {
  // fields go here

  String get email;

  ForgotPassword._();

  factory ForgotPassword([updates(ForgotPasswordBuilder b)]) = _$ForgotPassword;
}

abstract class FindPassword extends EditProfileEvent
    implements Built<FindPassword, FindPasswordBuilder> {
  // fields go here

  String get email;

  FindPassword._();

  factory FindPassword([updates(FindPasswordBuilder b)]) = _$FindPassword;
}

abstract class ResetPassword extends EditProfileEvent
    implements Built<ResetPassword, ResetPasswordBuilder> {
  // fields go here

  String get old_password;

  String get password;

  String get password_confirmation;

  ResetPassword._();

  factory ResetPassword([updates(ResetPasswordBuilder b)]) = _$ResetPassword;
}

abstract class TryEdit extends EditProfileEvent
    implements Built<TryEdit, TryEditBuilder> {
  // fields go here

  String get first_name;

  String get last_name;

  String get email;
  String? get facebook;
  String? get youtube;
  String? get instagram;
  String? get linkedin;
  String? get twitter;
  String? get snapchat;
  String get phone;

  File? get image;

  String get summary;

  String get gender;

  int get countryId;

  int get cityId;

  List<SkillModel> get skills;

  TryEdit._();

  factory TryEdit([updates(TryEditBuilder b)]) = _$TryEdit;
}
