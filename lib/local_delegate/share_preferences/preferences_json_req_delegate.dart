import '../../http_delegate/base_json_mapper.dart';

abstract class PreferencesReqDelegate {
  getJsonObject<T extends BaseJsonMapper>(String key, T refType);

  Future<bool> setJsonObject<T extends BaseJsonMapper>(String key, T object);

  Future<List<T>> getJsonList<T extends BaseJsonMapper>(String key, T refType);

  bool getBoolean(String key);

  Future<bool> setBoolean(String key, bool value);

  Future<bool> deleteKey(String key);
}
