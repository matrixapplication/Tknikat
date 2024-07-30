library auth_event;

import 'dart:io';

import 'package:built_value/built_value.dart';

part 'auth_event.g.dart';

abstract class AuthEvent {}

abstract class TryLogin extends AuthEvent
    implements Built<TryLogin, TryLoginBuilder> {
  // fields go here

  String get phone;

  String get password;

  TryLogin._();

  factory TryLogin([updates(TryLoginBuilder b)]) = _$TryLogin;
}

abstract class TryLoginWithGoogle extends AuthEvent
    implements Built<TryLoginWithGoogle, TryLoginWithGoogleBuilder> {
  // fields go here
  String get name;
  String get email;
  String get phone;
  String get uId;


  TryLoginWithGoogle._();

  factory TryLoginWithGoogle([updates(TryLoginWithGoogleBuilder b)]) = _$TryLoginWithGoogle;
}


abstract class ClearError extends AuthEvent
    implements Built<ClearError, ClearErrorBuilder> {
  // fields go here

  ClearError._();

  factory ClearError([updates(ClearErrorBuilder b)]) = _$ClearError;
}

abstract class ActivateAccount extends AuthEvent
    implements Built<ActivateAccount, ActivateAccountBuilder> {
  // fields go here
  String get email;
  String get activation_code;

  ActivateAccount._();

  factory ActivateAccount([updates(ActivateAccountBuilder b)]) =
      _$ActivateAccount;
}

abstract class VerfyCode extends AuthEvent
    implements Built<VerfyCode, VerfyCodeBuilder> {
  // fields go here
  String get email;
  String get activation_code;

  VerfyCode._();

  factory VerfyCode([updates(VerfyCodeBuilder b)]) = _$VerfyCode;
}

abstract class SignUp extends AuthEvent
    implements Built<SignUp, SignUpBuilder> {
  // fields go here

  String get first_name;
  String get last_name;

  String get phoneNumber;
  String get email;

  String get password;
  // bool get terms;
  // String? get gender;
  // File get avatar;
  // int? get country;
  // int? get city;

  SignUp._();

  factory SignUp([updates(SignUpBuilder b)]) = _$SignUp;
}
abstract class CompleteProfile extends AuthEvent
    implements Built<CompleteProfile, CompleteProfileBuilder> {

  String? get phoneNumber;
  String? get email;

  String? get gender;
  File get avatar;
  int? get country;
  int? get city;

  CompleteProfile._();

  factory CompleteProfile([updates(CompleteProfileBuilder b)]) = _$CompleteProfile;
}

abstract class ResetPassword extends AuthEvent
    implements Built<ResetPassword, ResetPasswordBuilder> {
  // fields go here

  String get email;

  String get password;

  String get confirmPassword;

  ResetPassword._();

  factory ResetPassword([updates(ResetPasswordBuilder b)]) = _$ResetPassword;
}

abstract class ResendCode extends AuthEvent
    implements Built<ResendCode, ResendCodeBuilder> {
  String get email;
  ResendCode._();

  factory ResendCode([updates(ResendCodeBuilder b)]) = _$ResendCode;
}

abstract class TryForgetPassword extends AuthEvent
    implements Built<TryForgetPassword, TryForgetPasswordBuilder> {
  String get email;
  TryForgetPassword._();

  factory TryForgetPassword([updates(TryForgetPasswordBuilder b)]) =
      _$TryForgetPassword;
}

abstract class TryForgetPasswordConfirm extends AuthEvent
    implements
        Built<TryForgetPasswordConfirm, TryForgetPasswordConfirmBuilder> {
  String get email;
  String get password;
  String get token;
  TryForgetPasswordConfirm._();

  factory TryForgetPasswordConfirm(
          [updates(TryForgetPasswordConfirmBuilder b)]) =
      _$TryForgetPasswordConfirm;
}
