import 'package:injectable/injectable.dart';

import '../../../local_delegate/share_preferences/preferences_json_req_delegate.dart';
import '../model/user.dart';
import 'login_service.dart';

@Injectable(as: LoginService)
class LoginServiceImpl implements LoginService {
  final PreferencesReqDelegate reqDelegate;

  LoginServiceImpl({required this.reqDelegate});

  @override
  Future<User> getCurrentUser() {
    return reqDelegate.getJsonObject<User>("current_user", User());
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
