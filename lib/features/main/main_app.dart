import 'package:flutter/material.dart';
import 'package:mo_money_app/features/main/router.gr.dart';

import 'app_theme.dart';

class MainApp extends StatelessWidget {
  final AppRouter router;

  const MainApp({Key? key, required this.router}) : super(key: key);

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
