import 'package:injectable/injectable.dart';
import 'package:model/login/user.dart';

import '../../../../local_delegate/share_preferences/preferences_json_req_delegate.dart';
import 'local_login_datasource.dart';

@Injectable(as: LocalLoginDataSource)
class LocalLoginDataSourceImpl implements LocalLoginDataSource {
  final PreferencesReqDelegate reqDelegate;

  LocalLoginDataSourceImpl({required this.reqDelegate});

  @override
  Future<User> getCurrentUser() async {
    final result = await reqDelegate.getJsonObject("current_user");
    return User().fromJson(result);
  }

  @override
  Future<bool> isLoggedIn() async {
    return reqDelegate.getBoolean("logged");
  }

  @override
  Future<bool> login() async {
    return reqDelegate.setBoolean("logged", true);
  }

  @override
  Future<bool> logout() {
    final value = reqDelegate.deleteKey("current_user");
    return value;
  }

  @override
  Future<bool> registerUser(User user) async {
    final isRegistered = await reqDelegate.setJsonObject("current_user", user);
    return reqDelegate.setBoolean("logged", isRegistered);
  }
}
