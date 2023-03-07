import 'package:injectable/injectable.dart';

import '../../../local_delegate/share_preferences/preferences_delegate_general_exception.dart';
import '../data_source/login_service.dart';
import '../model/user.dart';
import 'login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginService loginService;

  LoginRepositoryImpl({required this.loginService});

  @override
  Future<User?> getCurrentUser() async {
    try {
      final user = await loginService.getCurrentUser();
      return user;
    } on PreferencesDelegateGeneralException {
      return null;
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      final isLoggedIn = await loginService.getCurrentUser();
      return true;
    } on PreferencesDelegateGeneralException {
      return false;
    }
  }

  @override
  Future<bool> login() async {
    try {
      final isLoggedIn = await loginService.login();
      return isLoggedIn;
    } on PreferencesDelegateGeneralException {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      final isLoggedIn = await loginService.logout();
      return isLoggedIn;
    } on PreferencesDelegateGeneralException {
      return false;
    }
  }

  @override
  Future<bool> registerUser(User user) async {
    try {
      final isLoggedIn = await loginService.registerUser(user);
      return isLoggedIn;
    } on PreferencesDelegateGeneralException {
      return false;
    }
  }
}
