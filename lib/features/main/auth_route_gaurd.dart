import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:mo_money_app/features/login/repository/login_repository.dart';
import 'package:mo_money_app/features/main/router.gr.dart';
@Injectable()
class AuthenticatedRouteGuard extends AutoRouteGuard {
  final LoginRepository loginRepository;

  AuthenticatedRouteGuard(this.loginRepository);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await loginRepository.isLoggedIn()) {
      resolver.next(true);
    } else {
      router.push(
        LoginPage(
          onLoginState: (bool success) async {
            if (success) {
              resolver.next(success);
              router.popTop();
            }
          },
        ),
      );
    }
  }
}
