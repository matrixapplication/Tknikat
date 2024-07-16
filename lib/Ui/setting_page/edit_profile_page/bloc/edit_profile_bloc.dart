import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/injectoin.dart';

import '../../../../data/prefs_helper/prefs_helper.dart';
import '../../../auth_screen/page/complete_profile_page.dart';
import 'edit_profile_event.dart';
import 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  Repository _repository;

  EditProfileBloc(this._repository) : super(EditProfileState.initail()) {
    on<ClearState>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<ChangeStatus>(
      (event, emit) => emit(state.rebuild((b) => b
        ..success = false
        ..successSignup = false)),
    );
    on<GetProfile>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..isCompleted=false
          ..data = null));
        var user = await _repository.getProfile();
        appUser = user;
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..isCompleted= user.isCompleted != 0
          ..data.replace(user)));
      } on NetworkException catch (e) {
        print('GetProfile Error $e');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..data = null
          ..isCompleted=false
          ..error = e.error.toString()
          ..success = false));
      }
    });
    on<TryEdit>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false));
        final data = await _repository.editProfile(
          first_name: event.first_name,
          last_name: event.last_name,
          email: event.email,
          facebook: event.facebook,
          instagram: event.instagram,
          snapchat: event.snapchat,
          youtube: event.youtube,
          linkedin: event.linkedin,
          phone: event.phone,
          summary: event.summary,
          skills: event.skills,
          countryId: event.countryId,
          cityId: event.cityId,
          image: event.image,
          gender: event.gender,
        );

        if (data != null) appUser = data;
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()
          ..success = false));
      }
    });
    on<ResetPassword>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false));

        final date = await _repository.resetPassword(
            event.old_password, event.password, event.password_confirmation);
        print('GetProfile Success data ${date}');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = "Reset Password Successful"
          ..success = true));
      } catch (e) {
        print('GetProfile Error $e');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..data = null
          ..success = false));
      }
    });
  }
}
