import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mo_money_app/features/messages/repository/message_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/login/data_source/login_service.dart';
import '../features/login/data_source/login_service_impl.dart';
import '../features/login/repository/login_repository.dart';
import '../features/login/repository/login_repository_impl.dart';
import '../features/main/auth_route_gaurd.dart';
import '../features/messages/data_source/message_service.dart';
import '../features/messages/data_source/message_service_impl.dart';
import '../features/messages/repository/message_repository_impl.dart';
import '../features/transactions/data_source/transaction_service.dart';
import '../features/transactions/data_source/transaction_service_impl.dart';
import '../features/transactions/repository/transaction_repository.dart';
import '../features/transactions/repository/transaction_repository_impl.dart';
import '../local_delegate/asset/asset_json_req_delegate.dart';
import '../local_delegate/asset/asset_json_req_delegate_impl.dart';
import '../local_delegate/share_preferences/preferences_json_req_delegate.dart';
import '../local_delegate/share_preferences/preferences_req_delegate_impl.dart';

final _locator = GetIt.instance;

GetIt get moduleLocator => _locator;

Future<void> initRemoteDataModules() async {
  final sharePreferences = await SharedPreferences.getInstance();
  _locator.registerLazySingleton<AssetBundle>(() => rootBundle);
  _locator.registerLazySingleton<SharedPreferences>(() => sharePreferences);
  _locator.registerLazySingleton<AssetJsonReqDelegate>(
      () => AssetJsonReqDelegateImpl(service: _locator<AssetBundle>()));
  _locator.registerLazySingleton<PreferencesReqDelegate>(() =>
      PreferencesReqDelegateImpl(preferences: _locator<SharedPreferences>()));
  _initServiceAndRepositoryModules();
}

void _initServiceAndRepositoryModules() {
  _locator.registerLazySingleton<TransactionsService>(() =>
      TransactionsServiceImpl(reqDelegate: _locator<AssetJsonReqDelegate>()));
  _locator.registerLazySingleton<TransactionRepository>(() =>
      TransactionRepositoryImpl(
          transactionService: _locator<TransactionsService>()));
  _locator.registerLazySingleton<MessageService>(
      () => MessageServiceImpl(reqDelegate: _locator<AssetJsonReqDelegate>()));
  _locator.registerLazySingleton<MessageRepository>(
      () => MessageRepositoryImpl(messageService: _locator<MessageService>()));

  _locator.registerLazySingleton<LoginService>(
      () => LoginServiceImpl(reqDelegate: _locator<PreferencesReqDelegate>()));
  _locator.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginService: _locator<LoginService>()));
  _locator.registerLazySingleton<AuthenticatedRouteGuard>(
      () => AuthenticatedRouteGuard(_locator<LoginRepository>()));
}
