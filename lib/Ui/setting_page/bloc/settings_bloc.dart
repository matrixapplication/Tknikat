import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_event.dart';
import 'package:taknikat/Ui/setting_page/bloc/settings_state.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/injectoin.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  Repository _repository;

  SettingsBloc(this._repository) : super(SettingsState.initail()) {
    on<InitSettings>((event, emit) async {
      emit(state.rebuild((b) => b..initialized = false));

      print('InitSettings');
      try {
        var countries = await _repository.getCountries();
        print('ddd ${countries.map((p0) => p0.name.toString())}');
        var skillsData = await _repository.getSkills();
        var viewCart = appUser != null ? await _repository.viewCart() : null;
        appCountries=countries.map((p0) => p0).toList();
        appLanguage = await _repository.getAppLanguage();
        appAuthState = await _repository.getIsLogin();
        if (appAuthState) appUser = await _repository.getUser();

        emit(state.rebuild((b) {
          b
            ..initialized = true
            ..appLanguage = appLanguage
            ..isLogin = appAuthState
            ..skills.replace(skillsData)
            ..viewCart = viewCart
            ..countries.replace(countries);
          // ..notification = notification
          // ..currency = currency
          if (appAuthState) b..user.replace(appUser!);
          return b;
        }));
      } catch (e) {
        log('Catch');
        print(e);
        emit(state.rebuild((b) => b..initialized = true));
      }
    });
    on<ClearError>((event, emit) => emit(state.rebuild((b) => b..error = "")));
    on<GetAppLanguage>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false));

        String lang = await _repository.getAppLanguage();
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..appLanguage = lang));
      } catch (e) {
        print('Error: ${e.toString()}\n');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..success = false));
      }
    });
    on<ChangeStatus>((event, emit) => emit(state.rebuild((b) => b..logout = false)));
    on<GetUserData>((event, emit) async {
      print('GetUserData //////////');
      try {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = false));

        final data = await _repository.getUser();
        // final rates = await _repository.getRates();
        // try {
        //   final data = await _repository.getAppLanguage();
        //   print('GetAppLanguage $data');
        //   yield state.rebuild((b) => b..appLanguage = data);
        // } catch (e) {
        //   print('GetAppLanguage Error $e');
        //   yield state.rebuild((b) => b..appLanguage = 0);
        // }

        print("appUser!: " + data.toString());

        // emit(state.rebuild((b) => b

        //     //  ..rate = rates.length
        //     ));
        if (data!.id != null)
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..error = ""
            ..user.replace(data)));
        else
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..error = ""));
      } catch (e) {
        print('Error: ${e.toString()}\n');
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""
          ..success = false));
      }
    });
    on<GetIsLogin>((event, emit) async {
      try {
        final result = await _repository.getIsLogin();
        emit(state.rebuild((b) => b..isLogin = result));
      } catch (e) {
        print(' Error $e');
        emit(state.rebuild((b) => b..error = ""));
      }
    });
    on<GetNotification>((event, emit) async {
      try {
        final result = await _repository.getNotification();
        emit(state.rebuild((b) => b..notification = result));
      } catch (e) {
        print(' Error $e');
        emit(state.rebuild((b) => b..error = ""));
      }
    });
    on<SetNotification>((event, emit) async {
      try {
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..error = ""));

        await _repository.setNotification(event.value);
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = ""
          ..success = true
          ..notification = event.value));
      } catch (e) {
        print('Error: ${e.toString()}\n');
        emit(state.rebuild((b) => b
          ..isLoading = true
          ..success = false));
      }
    });
  }
}
