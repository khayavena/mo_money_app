// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mo_money_app/di/app_module.dart' as _i33;
import 'package:mo_money_app/features/login/bloc/get_login_bloc.dart' as _i31;
import 'package:mo_money_app/features/login/bloc/get_profile_bloc.dart' as _i32;
import 'package:mo_money_app/features/login/data_source/login_service.dart'
    as _i27;
import 'package:mo_money_app/features/login/data_source/login_service_impl.dart'
    as _i28;
import 'package:mo_money_app/features/login/repository/login_repository.dart'
    as _i29;
import 'package:mo_money_app/features/login/repository/login_repository_impl.dart'
    as _i30;
import 'package:mo_money_app/features/messages/bloc/get_messages_bloc.dart'
    as _i25;
import 'package:mo_money_app/features/messages/data_source/message_service.dart'
    as _i8;
import 'package:mo_money_app/features/messages/data_source/message_service_impl.dart'
    as _i9;
import 'package:mo_money_app/features/messages/data_source/remote/remote_transaction_service.dart'
    as _i12;
import 'package:mo_money_app/features/messages/data_source/remote/remote_transaction_service_impl.dart'
    as _i13;
import 'package:mo_money_app/features/messages/repository/message_repository.dart'
    as _i19;
import 'package:mo_money_app/features/messages/repository/message_repository_impl.dart'
    as _i20;
import 'package:mo_money_app/features/transactions/bloc/get_transactions_bloc.dart'
    as _i26;
import 'package:mo_money_app/features/transactions/data_source/local/transaction_service.dart'
    as _i17;
import 'package:mo_money_app/features/transactions/data_source/local/transaction_service_impl.dart'
    as _i18;
import 'package:mo_money_app/features/transactions/data_source/remote/remote_transaction_service.dart'
    as _i14;
import 'package:mo_money_app/features/transactions/data_source/remote/remote_transaction_service_impl.dart'
    as _i15;
import 'package:mo_money_app/features/transactions/repository/transaction_repository.dart'
    as _i23;
import 'package:mo_money_app/features/transactions/repository/transaction_repository_impl.dart'
    as _i24;
import 'package:mo_money_app/http_delegate/http_req_delegate.dart' as _i6;
import 'package:mo_money_app/http_delegate/http_req_delegate_impl.dart' as _i7;
import 'package:mo_money_app/local_delegate/asset/asset_json_req_delegate.dart'
    as _i3;
import 'package:mo_money_app/local_delegate/asset/asset_json_req_delegate_impl.dart'
    as _i4;
import 'package:mo_money_app/local_delegate/share_preferences/preferences_json_req_delegate.dart'
    as _i21;
import 'package:mo_money_app/local_delegate/share_preferences/preferences_req_delegate_impl.dart'
    as _i22;
import 'package:mo_money_app/shared_components/util/NetworkHelper.dart' as _i10;
import 'package:mo_money_app/shared_components/util/NetworkHelperImpl.dart'
    as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
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
  gh.factory<_i3.AssetJsonReqDelegate>(() => _i4.AssetJsonReqDelegateImpl());
  gh.lazySingleton<_i5.Dio>(() => appModule.getDio);
  gh.factory<_i6.HttpReqDelegate>(
      () => _i7.HttpReqDelegateImpl(dioClient: gh<_i5.Dio>()));
  gh.factory<_i8.MessageService>(() =>
      _i9.MessageServiceImpl(reqDelegate: gh<_i3.AssetJsonReqDelegate>()));
  gh.factory<_i10.NetworkHelper>(() => _i11.NetworkHelperImpl());
  gh.factory<_i12.RemoteMessagesService>(() => _i13.RemoteMessagesServiceImpl(
      httpReqDelegate: gh<_i6.HttpReqDelegate>()));
  gh.factory<_i14.RemoteTransactionsService>(() =>
      _i15.RemoteTransactionsServiceImpl(
          httpReqDelegate: gh<_i6.HttpReqDelegate>()));
  await gh.factoryAsync<_i16.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i17.TransactionsService>(() => _i18.TransactionsServiceImpl(
      reqDelegate: gh<_i3.AssetJsonReqDelegate>()));
  gh.factory<_i19.MessageRepository>(() => _i20.MessageRepositoryImpl(
        messageService: gh<_i8.MessageService>(),
        remoteMessagesService: gh<_i12.RemoteMessagesService>(),
        networkHelper: gh<_i10.NetworkHelper>(),
      ));
  gh.factory<_i21.PreferencesReqDelegate>(() => _i22.PreferencesReqDelegateImpl(
      preferences: gh<_i16.SharedPreferences>()));
  gh.factory<_i23.TransactionRepository>(() => _i24.TransactionRepositoryImpl(
        transactionService: gh<_i17.TransactionsService>(),
        remoteTransactionsService: gh<_i14.RemoteTransactionsService>(),
        networkHelper: gh<_i10.NetworkHelper>(),
      ));
  gh.factory<_i25.GetMessagesBloc>(
      () => _i25.GetMessagesBloc(repository: gh<_i19.MessageRepository>()));
  gh.factory<_i26.GetTransactionsBloc>(() =>
      _i26.GetTransactionsBloc(repository: gh<_i23.TransactionRepository>()));
  gh.factory<_i27.LoginService>(() =>
      _i28.LoginServiceImpl(reqDelegate: gh<_i21.PreferencesReqDelegate>()));
  gh.factory<_i29.LoginRepository>(
      () => _i30.LoginRepositoryImpl(loginService: gh<_i27.LoginService>()));
  gh.factory<_i31.GetLoginBloc>(
      () => _i31.GetLoginBloc(repository: gh<_i29.LoginRepository>()));
  gh.factory<_i32.GetProfileBloc>(
      () => _i32.GetProfileBloc(repository: gh<_i29.LoginRepository>()));
  return getIt;
}

class _$AppModule extends _i33.AppModule {}
