import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_money_app/features/messages/bloc/get_messages_bloc.dart';

import '../features/login/bloc/get_login_bloc.dart';
import '../features/login/bloc/get_profile_bloc.dart';
import '../features/login/repository/login_repository.dart';
import '../features/main/auth_route_gaurd.dart';
import '../features/main/main_app.dart';
import '../features/main/router.gr.dart';
import '../features/transactions/bloc/get_transactions_bloc.dart';
import 'module_locator.dart';

Future<void> provideMainApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GetTransactionsBloc>(
          lazy: true,
          create: (BuildContext context) =>
              moduleLocator<GetTransactionsBloc>(),
        ),
        BlocProvider<GetMessagesBloc>(
          lazy: true,
          create: (BuildContext context) => moduleLocator<GetMessagesBloc>(),
        ),
        BlocProvider<GetLoginBloc>(
          lazy: true,
          create: (BuildContext context) => moduleLocator<GetLoginBloc>(),
        ),
        BlocProvider<GetProfileBloc>(
          lazy: true,
          create: (BuildContext context) => moduleLocator<GetProfileBloc>(),
        ),
      ],
      child: MainApp(
        router: AppRouter(
            authenticatedRouteGuard:
                AuthenticatedRouteGuard(moduleLocator<LoginRepository>())),
      ),
    ),
  );
}
