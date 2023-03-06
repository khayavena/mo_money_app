// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../home/page/home_page.dart' as _i1;
import '../login/page/login_page.dart' as _i3;
import '../login/page/profile_page.dart' as _i2;
import '../messages/page/messages_page.dart' as _i5;
import '../transactions/page/card_detail_page.dart' as _i4;
import 'auth_route_gaurd.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter({
    _i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
    required this.authenticatedRouteGuard,
  }) : super(navigatorKey);

  final _i8.AuthenticatedRouteGuard authenticatedRouteGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.ProfilePage(),
        transitionsBuilder: _i6.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.LoginPage(
          key: args.key,
          onLoginState: args.onLoginState,
        ),
      );
    },
    CardDetailRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.CardDetailPage(),
        transitionsBuilder: _i6.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MessageListRoute.name: (routeData) {
      final args = routeData.argsAs<MessageListRouteArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.MessageListPage(
          key: args.key,
          title: args.title,
        ),
        transitionsBuilder: _i6.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [authenticatedRouteGuard],
        ),
        _i6.RouteConfig(
          ProfileRoute.name,
          path: '/profile-page',
        ),
        _i6.RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        _i6.RouteConfig(
          CardDetailRoute.name,
          path: '/card-detail-page',
        ),
        _i6.RouteConfig(
          MessageListRoute.name,
          path: '/message-list-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile-page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i7.Key? key,
    required dynamic Function(bool) onLoginState,
  }) : super(
          LoginRoute.name,
          path: '/login-page',
          args: LoginRouteArgs(
            key: key,
            onLoginState: onLoginState,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onLoginState,
  });

  final _i7.Key? key;

  final dynamic Function(bool) onLoginState;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginState: $onLoginState}';
  }
}

/// generated route for
/// [_i4.CardDetailPage]
class CardDetailRoute extends _i6.PageRouteInfo<void> {
  const CardDetailRoute()
      : super(
          CardDetailRoute.name,
          path: '/card-detail-page',
        );

  static const String name = 'CardDetailRoute';
}

/// generated route for
/// [_i5.MessageListPage]
class MessageListRoute extends _i6.PageRouteInfo<MessageListRouteArgs> {
  MessageListRoute({
    _i7.Key? key,
    required String title,
  }) : super(
          MessageListRoute.name,
          path: '/message-list-page',
          args: MessageListRouteArgs(
            key: key,
            title: title,
          ),
        );

  static const String name = 'MessageListRoute';
}

class MessageListRouteArgs {
  const MessageListRouteArgs({
    this.key,
    required this.title,
  });

  final _i7.Key? key;

  final String title;

  @override
  String toString() {
    return 'MessageListRouteArgs{key: $key, title: $title}';
  }
}
