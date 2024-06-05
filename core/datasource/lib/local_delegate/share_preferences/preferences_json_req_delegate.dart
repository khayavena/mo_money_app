
abstract class PreferencesReqDelegate {


  Future<bool> setJsonObject(String key, dynamic object);

  Future<dynamic> getJsonObject(String key);

  bool getBoolean(String key);

  Future<bool> setBoolean(String key, bool value);

  Future<bool> deleteKey(String key);
}
