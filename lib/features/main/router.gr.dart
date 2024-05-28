// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:mo_money_app/features/home/page/home_page.dart' as _i2;
import 'package:mo_money_app/features/login/page/login_page.dart' as _i3;
import 'package:mo_money_app/features/login/page/profile_page.dart' as _i5;
import 'package:mo_money_app/features/messages/page/messages_page.dart' as _i4;
import 'package:mo_money_app/features/transactions/page/card_detail_page.dart'
    as _i1;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CardDetailPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CardDetailPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    LoginPage.name: (routeData) {
      final args = routeData.argsAs<LoginPageArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginPage(
          key: args.key,
          onLoginState: args.onLoginState,
        ),
      );
    },
    MessageListPage.name: (routeData) {
      final args = routeData.argsAs<MessageListPageArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.MessageListPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    ProfilePage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfilePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CardDetailPage]
class CardDetailPage extends _i6.PageRouteInfo<void> {
  const CardDetailPage({List<_i6.PageRouteInfo>? children})
      : super(
          CardDetailPage.name,
          initialChildren: children,
        );

  static const String name = 'CardDetailPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomePage extends _i6.PageRouteInfo<void> {
  const HomePage({List<_i6.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginPage extends _i6.PageRouteInfo<LoginPageArgs> {
  LoginPage({
    _i7.Key? key,
    required dynamic Function(bool) onLoginState,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LoginPage.name,
          args: LoginPageArgs(
            key: key,
            onLoginState: onLoginState,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i6.PageInfo<LoginPageArgs> page =
      _i6.PageInfo<LoginPageArgs>(name);
}

class LoginPageArgs {
  const LoginPageArgs({
    this.key,
    required this.onLoginState,
  });

  final _i7.Key? key;

  final dynamic Function(bool) onLoginState;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key, onLoginState: $onLoginState}';
  }
}

/// generated route for
/// [_i4.MessageListPage]
class MessageListPage extends _i6.PageRouteInfo<MessageListPageArgs> {
  MessageListPage({
    _i7.Key? key,
    required String title,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          MessageListPage.name,
          args: MessageListPageArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MessageListPage';

  static const _i6.PageInfo<MessageListPageArgs> page =
      _i6.PageInfo<MessageListPageArgs>(name);
}

class MessageListPageArgs {
  const MessageListPageArgs({
    this.key,
    required this.title,
  });

  final _i7.Key? key;

  final String title;

  @override
  String toString() {
    return 'MessageListPageArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i5.ProfilePage]
class ProfilePage extends _i6.PageRouteInfo<void> {
  const ProfilePage({List<_i6.PageRouteInfo>? children})
      : super(
          ProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
