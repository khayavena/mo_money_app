import 'package:flutter/material.dart';
import 'package:mo_money_app/features/main/router.dart';
import 'package:mo_money_app/features/main/router.gr.dart';

import 'app_theme.dart';

class MainApp extends StatelessWidget {
  final AppRouter router;

  const MainApp({super.key, required this.router});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.getAppTheme,
      routerDelegate: router.delegate(),
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
