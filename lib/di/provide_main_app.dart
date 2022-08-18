import 'package:business_banking_app/di/module_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/main/main_app.dart';
import '../features/post/bloc/get_posts_bloc.dart';
import '../features/post/repository/post_repository.dart';

Future<void> provideMainApp() async {
  await initRemoteDataModules();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GetPostsBloc>(
          lazy: true,
          create: (BuildContext context) =>
              GetPostsBloc(repository: moduleLocator<UserRepository>()),
        )
      ],
      child: const MainApp(),
    ),
  );
}
