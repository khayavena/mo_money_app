library http_delegate;

import 'dart:convert';

import 'package:datasource/local_delegate/share_preferences/preferences_delegate_general_exception.dart';
import 'package:datasource/local_delegate/share_preferences/preferences_json_req_delegate.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


@Injectable(as: PreferencesReqDelegate)
class PreferencesReqDelegateImpl implements PreferencesReqDelegate {
  final SharedPreferences preferences;

  PreferencesReqDelegateImpl({required this.preferences});

  @override
  bool getBoolean(String key) {
    final value = preferences.getBool(key);
    return value ?? false;
  }


  @override
  Future<dynamic> getJsonObject(String key) async {
    final result = preferences.getString(key);
    if (result == null) {
      throw PreferencesDelegateGeneralException();
    } else {
      return jsonDecode(result);
    }
  }

  @override
  Future<bool> setJsonObject(
      String key, dynamic object) async {
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
    final isRemoved = await preferences.remove(key);
    return isRemoved;
  }
}
