library http_delegate;

import 'dart:convert';

import 'package:mo_money_app/http_delegate/base_json_mapper.dart';
import 'package:mo_money_app/local_delegate/share_preferences/preferences_delegate_general_exception.dart';
import 'package:mo_money_app/local_delegate/share_preferences/preferences_json_req_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesReqDelegateImpl implements PreferencesReqDelegate {
  final SharedPreferences preferences;

  PreferencesReqDelegateImpl({required this.preferences});

  @override
  bool getBoolean(String key) {
    final value = preferences.getBool(key);
    return value ?? false;
  }

  @override
  Future<List<T>> getJsonList<T extends BaseJsonMapper>(
      String key, T refType) async {
    final result = preferences.getString(key);

    if (result == null) {
      throw PreferencesDelegateGeneralException();
    } else {
      return List<T>.from(
          jsonDecode(result).map((e) => refType.create().fromJson(e)));
    }
  }

  @override
  Future<T> getJsonObject<T extends BaseJsonMapper>(
      String key, T refType) async {
    final result = preferences.getString(key);
    if (result == null) {
      throw PreferencesDelegateGeneralException();
    } else {
      return refType.fromJson(jsonDecode(result));
    }
  }

  @override
  Future<bool> setJsonObject<T extends BaseJsonMapper>(
      String key, T object) async {
    final value2 = jsonEncode(object.toJson()).toString();
    final isSet = await preferences.setString(key, value2);
    return isSet;
  }

  @override
  Future<bool> setBoolean(String key, bool value) async {
    final isSet = await preferences.setBool(key, value);
    return isSet;
  }

  @override
  Future<bool> deleteKey(String key) async {
    final isSet = await preferences.remove(key);
    return isSet;
  }
}
