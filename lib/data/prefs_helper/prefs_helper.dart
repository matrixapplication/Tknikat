import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taknikat/core/app_language.dart';
import 'package:taknikat/core/base_widget/constent.dart';
import 'package:taknikat/model/user_model/user_model.dart';

class PrefsHelper {
  final box = GetStorage();

  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> getAppLanguage() async {
    return (await getPrefs()).getString(APP_LANGUAGE) ?? AppLanguageKeys.AR;
  }

  Future<void> setAppLanguage(String value) async {
    (await getPrefs()).setString(APP_LANGUAGE, value);
  }

  Future<String?> getToken() async {

    return box.read(TOKEN);
    // return ((await getPrefs()).getString(TOKEN));
  }

  Future<bool> getIsLogin() async {
    // TODO: implement getIsLogin
    return (await getPrefs()).getBool(IS_LOGIN) ?? false;
  }

  Future<bool> saveUser(UserModel user) async {
    try {

      (await getPrefs()).setBool(IS_LOGIN, true);
       box.write(APPUSER, jsonEncode(user));
       return true;
      // return (await getPrefs()).setString(APPUSER, jsonEncode(user));
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> saveToken(String token) async {
    box.write(TOKEN,token);

    (await getPrefs()).setString(TOKEN, token);
  }

  Future<UserModel> getUser() async {
    return UserModel.fromJson(
      json.decode(box.read(APPUSER)));
    return UserModel.fromJson(
        json.decode((await getPrefs()).getString(APPUSER)!));
  }

  Future<UserModel?> getUserOrNull() async {
    if (await getIsLogin())
      return UserModel.fromJson(
          json.decode(box.read(APPUSER)));
      // return UserModel.fromJson(
      //     json.decode((await getPrefs()).getString(APPUSER)!));
    else
      return null;
  }

  Future logout() async {

    box.erase();
    (await getPrefs()).setBool(IS_LOGIN, false);
    (await getPrefs()).setString(TOKEN, '');
  }

  Future<bool> getNotification() async {
    // TODO: implement getCurrency
    return (await getPrefs()).getBool(NOTIFI) ?? false;
  }

  Future<void> setNotification(bool value) async {
    // TODO: implement setCurrency
    (await getPrefs()).setBool(NOTIFI, value);
  }
}
