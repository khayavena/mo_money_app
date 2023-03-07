import 'package:auto_route/auto_route.dart';
import 'package:mo_money_app/features/login/repository/login_repository.dart';
import 'package:mo_money_app/features/main/router.gr.dart';
class AuthenticatedRouteGuard extends AutoRouteGuard {
  final LoginRepository loginRepository;

  AuthenticatedRouteGuard(this.loginRepository);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await loginRepository.isLoggedIn()) {
      resolver.next(true);
    } else {
      router.push(
        LoginRoute(
          onLoginState: (success) {
            resolver.next(success);
          },
        ),
      );
    }
  }
}
