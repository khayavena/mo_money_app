import 'package:auto_route/auto_route.dart';

import '../home/page/home_page.dart';
import '../login/page/login_page.dart';
import '../login/page/profile_page.dart';
import '../messages/page/messages_page.dart';
import '../transactions/page/card_detail_page.dart';
import 'auth_route_gaurd.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
      guards: [AuthenticatedRouteGuard],
    ),
    CustomRoute(
        page: ProfilePage, transitionsBuilder: TransitionsBuilders.slideBottom),
    AutoRoute(page: LoginPage),
    CustomRoute(
        page: CardDetailPage,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
    CustomRoute(
      page: MessageListPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),
  ],
)
class $AppRouter {}
