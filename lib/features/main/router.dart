import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:mo_money_app/features/main/router.gr.dart';

import '../login/repository/login_repository.dart';
import 'auth_route_gaurd.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  final AuthenticatedRouteGuard authenticatedRouteGuard;

  AppRouter(
      {super.navigatorKey,
      required this.authenticatedRouteGuard});

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: HomePage.page,
          initial: true,
          guards: [authenticatedRouteGuard],
        ),
        CustomRoute(
            page: ProfilePage.page,
            transitionsBuilder: TransitionsBuilders.slideBottom),
        AutoRoute(page: LoginPage.page),
        CustomRoute(
            page: CardDetailPage.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(
          page: MessageListPage.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
      ];
}
