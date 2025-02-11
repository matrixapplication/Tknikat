import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:taknikat/data/repository/repository.dart';
import 'package:taknikat/injectoin.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  Repository _repository;

  AppBloc(this._repository) : super(AppState.initail()) {
    on<InitEvent>((event, emit) async {
      appAuthState = await _repository.getIsLogin();
      appLanguage = await _repository.getAppLanguage();
      if (appAuthState) appUser = await _repository.getUser();

      emit(state.rebuild((b) {
        b
          ..loginState = appAuthState
          ..appLanguage = appLanguage
          ..initialized = true;
        if (appAuthState) b..user.replace(appUser!);
      }));
    });
    on<ChangeAppLanguage>((event, emit) async {
      try {
        await _repository.setAppLanguage(event.appLanguage);
        emit(state.rebuild((b) => b..appLanguage = event.appLanguage));
        appLanguage = event.appLanguage;
      } catch (e) {
        print('Error: ChangeAppLanguage ${e.toString()}\n');
      }
    });
    on<SetNewLanguage>((event, emit) async {
      try {
        await _repository.setAppLanguage(event.lang);
        emit(state.rebuild((b) => b..appLanguage = event.lang));
        appLanguage = event.lang;
      } catch (e) {
        print('Error: ChangeAppLanguage ${e.toString()}\n');
      }
    });
    on<LogOutUser>((event, emit) async {
      try {
        final date = await _repository.logout();
        print('Logout Success data $date');
        appAuthState = false;
        appUser = null;

        emit(state.rebuild((b) => b
          ..loginState = false
          ..user = null));
      } catch (e) {
        print('Logout Error $e');
      }
    });
    on<DeleteAccount>((event, emit) async {
      try {
        await _repository.deleteAccount();

        appAuthState = false;
        appUser = null;
        final box = GetStorage();

        box.erase();
        emit(state.rebuild((b) => b
          ..loginState = false
          ..user = null));
      } catch (e) {
        print('Deleting account failed Error $e');
      }
    });
    on<UpdateToken>((event, emit) async {
      if (await _repository.getIsLogin()) {
        if (appAuthState)
          final result = await _repository.updateToken(event.firebase_token);
      }
    });
  }
}
