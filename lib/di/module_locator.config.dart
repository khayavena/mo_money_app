// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mo_money_app/di/app_module.dart' as _i34;
import 'package:mo_money_app/features/login/bloc/get_login_bloc.dart' as _i27;
import 'package:mo_money_app/features/login/bloc/get_profile_bloc.dart' as _i26;
import 'package:mo_money_app/features/login/data_source/login_service.dart'
    as _i13;
import 'package:mo_money_app/features/login/data_source/login_service_impl.dart'
    as _i14;
import 'package:mo_money_app/features/login/repository/login_repository.dart'
    as _i19;
import 'package:mo_money_app/features/login/repository/login_repository_impl.dart'
    as _i20;
import 'package:mo_money_app/features/main/auth_route_gaurd.dart' as _i21;
import 'package:mo_money_app/features/messages/bloc/get_messages_bloc.dart'
    as _i33;
import 'package:mo_money_app/features/messages/data_source/message_service.dart'
    as _i17;
import 'package:mo_money_app/features/messages/data_source/message_service_impl.dart'
    as _i18;
import 'package:mo_money_app/features/messages/data_source/remote/remote_transaction_service.dart'
    as _i24;
import 'package:mo_money_app/features/messages/data_source/remote/remote_transaction_service_impl.dart'
    as _i25;
import 'package:mo_money_app/features/messages/repository/message_repository.dart'
    as _i31;
import 'package:mo_money_app/features/messages/repository/message_repository_impl.dart'
    as _i32;
import 'package:mo_money_app/features/transactions/bloc/get_transactions_bloc.dart'
    as _i30;
import 'package:mo_money_app/features/transactions/data_source/local/transaction_service.dart'
    as _i11;
import 'package:mo_money_app/features/transactions/data_source/local/transaction_service_impl.dart'
    as _i12;
import 'package:mo_money_app/features/transactions/data_source/remote/remote_transaction_service.dart'
    as _i22;
import 'package:mo_money_app/features/transactions/data_source/remote/remote_transaction_service_impl.dart'
    as _i23;
import 'package:mo_money_app/features/transactions/repository/transaction_repository.dart'
    as _i28;
import 'package:mo_money_app/features/transactions/repository/transaction_repository_impl.dart'
    as _i29;
import 'package:mo_money_app/http_delegate/http_req_delegate.dart' as _i15;
import 'package:mo_money_app/http_delegate/http_req_delegate_impl.dart' as _i16;
import 'package:mo_money_app/local_delegate/asset/asset_json_req_delegate.dart'
    as _i5;
import 'package:mo_money_app/local_delegate/asset/asset_json_req_delegate_impl.dart'
    as _i6;
import 'package:mo_money_app/local_delegate/share_preferences/preferences_json_req_delegate.dart'
    as _i7;
import 'package:mo_money_app/local_delegate/share_preferences/preferences_req_delegate_impl.dart'
    as _i8;
import 'package:mo_money_app/shared_components/util/NetworkHelper.dart' as _i9;
import 'package:mo_money_app/shared_components/util/NetworkHelperImpl.dart'
    as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i4.Dio>(() => appModule.getDio);
  gh.factory<_i5.AssetJsonReqDelegate>(() => _i6.AssetJsonReqDelegateImpl());
  gh.factory<_i7.PreferencesReqDelegate>(() =>
      _i8.PreferencesReqDelegateImpl(preferences: gh<_i3.SharedPreferences>()));
  gh.factory<_i9.NetworkHelper>(() => _i10.NetworkHelperImpl());
  gh.factory<_i11.TransactionsService>(() => _i12.TransactionsServiceImpl(
      reqDelegate: gh<_i5.AssetJsonReqDelegate>()));
  gh.factory<_i13.LoginService>(() =>
      _i14.LoginServiceImpl(reqDelegate: gh<_i7.PreferencesReqDelegate>()));
  gh.factory<_i15.HttpReqDelegate>(
      () => _i16.HttpReqDelegateImpl(client: gh<_i4.Dio>()));
  gh.factory<_i17.MessageService>(() =>
      _i18.MessageServiceImpl(reqDelegate: gh<_i5.AssetJsonReqDelegate>()));
  gh.factory<_i19.LoginRepository>(
      () => _i20.LoginRepositoryImpl(loginService: gh<_i13.LoginService>()));
  gh.factory<_i21.AuthenticatedRouteGuard>(
      () => _i21.AuthenticatedRouteGuard(gh<_i19.LoginRepository>()));
  gh.factory<_i22.RemoteTransactionsService>(() =>
      _i23.RemoteTransactionsServiceImpl(
          httpReqDelegate: gh<_i15.HttpReqDelegate>()));
  gh.factory<_i24.RemoteMessagesService>(() => _i25.RemoteMessagesServiceImpl(
      httpReqDelegate: gh<_i15.HttpReqDelegate>()));
  gh.factory<_i26.GetProfileBloc>(
      () => _i26.GetProfileBloc(repository: gh<_i19.LoginRepository>()));
  gh.factory<_i27.GetLoginBloc>(
      () => _i27.GetLoginBloc(repository: gh<_i19.LoginRepository>()));
  gh.factory<_i28.TransactionRepository>(() => _i29.TransactionRepositoryImpl(
        transactionService: gh<_i11.TransactionsService>(),
        remoteTransactionsService: gh<_i22.RemoteTransactionsService>(),
        networkHelper: gh<_i9.NetworkHelper>(),
      ));
  gh.factory<_i30.GetTransactionsBloc>(() =>
      _i30.GetTransactionsBloc(repository: gh<_i28.TransactionRepository>()));
  gh.factory<_i31.MessageRepository>(() => _i32.MessageRepositoryImpl(
        messageService: gh<_i17.MessageService>(),
        remoteMessagesService: gh<_i24.RemoteMessagesService>(),
        networkHelper: gh<_i9.NetworkHelper>(),
      ));
  gh.factory<_i33.GetMessagesBloc>(
      () => _i33.GetMessagesBloc(repository: gh<_i31.MessageRepository>()));
  return getIt;
}

class _$AppModule extends _i34.AppModule {}
