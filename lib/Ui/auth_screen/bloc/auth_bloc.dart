import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taknikat/core/error.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/injectoin.dart';

import '../../../app/App.dart';
import '../../base_page/base_page.dart';
import '../../setting_page/bloc/settings_bloc.dart';
import '../../setting_page/bloc/settings_event.dart' hide ClearError;
import '../page/complete_profile_page.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Repository _repository;

  AuthBloc(this._repository) : super(AuthState.initail()) {
    on<ClearError>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<TryLogin>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false));
        var data = await _repository.login(event.phone, event.password);
        sl<SettingsBloc>().add(InitSettings());
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..success = true
          ..user.replace(data.user!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()
          ..success = false));
      }
    });
    on<TryLoginWithGoogle>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false));
        var data = await _repository.loginWithGoogle(name: event.name,email: event.email,phone: event.phone,uId: event.uId);
        sl<SettingsBloc>().add(InitSettings());
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..success = true
          ..user.replace(data.user!)));
        if(data.user!.isCompleted==0){
          Navigator.of(navKey.currentContext!).pushReplacement(PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: CompleteProfilePage(phone: data.user?.phoneNumber??'', email: data.user?.email??'',)));
        }else{
          Navigator.of(navKey.currentContext!).pushReplacement(PageTransition(
              duration: Duration(milliseconds: 700),
              type: PageTransitionType.fade,
              child: BasePage()));
        }

      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()
          ..success = false));
      }
    });
    on<SignUp>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..successSignup = false
          //user/register
          ..user = null));
        final data = await _repository.register(
            event.first_name,
            event.last_name,
             event.email,
            event.password,
            event.phoneNumber
            // event.gender,
            // event.terms,
            // event.avatar,
            // event.country,
            // event.city
        );
          print('ssss ${data.toJson().toString()}');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..successSignup = true
          ..user.replace(data.user!)));

      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()
          ..successSignup = false
          ..user = null));
      }
    });
    on<TryForgetPasswordConfirm>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..successForget = false
          ..success = false));

        final result = await _repository.forgetPasswordConfirm(
            event.email, event.token, event.password);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = result ? null : "Code isn't valid"
          ..successForget = result));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..successForget = false
          ..error = e.error.toString()));
      }
    });
    on<TryForgetPassword>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false
          ..successForget = false));

        await _repository.forgetPassword(event.email);

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..successForget = true));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()
          ..successForget = false));
      }
    });
    on<ResendCode>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false));
        await _repository.sendCode(
          email: event.email,
        );
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
    on<ActivateAccount>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..successVerfy = false));

        final data = await _repository.activateAccountConfirm(
            event.email, event.activation_code);
        sl<SettingsBloc>().add(InitSettings());
        appUser =data.user!;

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..user.replace(data.user!)
          ..successVerfy = true));


      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
    on<VerfyCode>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..successVerfy = false));

        final data =
            await _repository.verfyCode(event.email, event.activation_code);
        await _repository.saveUser(data);
        appAuthState = true;

        appUser = data.user;

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..user.replace(data.user!)
          ..successVerfy = true));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()));
      }
    });
    on<CompleteProfile>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..successComplete = false
          ));

        final data = await _repository.completeProfile(
            event.email,
            event.gender,
            event.phoneNumber!,
            event.avatar,
            event.country,
            event.city
        );

        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..successComplete = true
          ..user.replace(data.user!)));
      } on NetworkException catch (e) {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = e.error.toString()
          ..successComplete = false
          ..user = null));
      }
    });

  }
}
