import '../model/user.dart';

abstract class LoginService {
  Future<bool> registerUser(User user);

  Future<User> getCurrentUser();

  Future<bool> login();

  Future<bool> isLoggedIn();

  Future<bool> logout();
}
