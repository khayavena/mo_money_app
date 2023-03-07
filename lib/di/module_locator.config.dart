// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mo_money_app/features/login/bloc/get_login_bloc.dart' as _i22;
import 'package:mo_money_app/features/login/bloc/get_profile_bloc.dart' as _i23;
import 'package:mo_money_app/features/login/data_source/login_service.dart'
    as _i18;
import 'package:mo_money_app/features/login/data_source/login_service_impl.dart'
    as _i19;
import 'package:mo_money_app/features/login/repository/login_repository.dart'
    as _i20;
import 'package:mo_money_app/features/login/repository/login_repository_impl.dart'
    as _i21;
import 'package:mo_money_app/features/messages/bloc/get_messages_bloc.dart'
    as _i16;
import 'package:mo_money_app/features/messages/data_source/message_service.dart'
    as _i5;
import 'package:mo_money_app/features/messages/data_source/message_service_impl.dart'
    as _i6;
import 'package:mo_money_app/features/messages/repository/message_repository.dart'
    as _i10;
import 'package:mo_money_app/features/messages/repository/message_repository_impl.dart'
    as _i11;
import 'package:mo_money_app/features/transactions/bloc/get_transactions_bloc.dart'
    as _i17;
import 'package:mo_money_app/features/transactions/data_source/transaction_service.dart'
    as _i8;
import 'package:mo_money_app/features/transactions/data_source/transaction_service_impl.dart'
    as _i9;
import 'package:mo_money_app/features/transactions/repository/transaction_repository.dart'
    as _i14;
import 'package:mo_money_app/features/transactions/repository/transaction_repository_impl.dart'
    as _i15;
import 'package:mo_money_app/local_delegate/asset/asset_json_req_delegate.dart'
    as _i3;
import 'package:mo_money_app/local_delegate/asset/asset_json_req_delegate_impl.dart'
    as _i4;
import 'package:mo_money_app/local_delegate/share_preferences/preferences_json_req_delegate.dart'
    as _i12;
import 'package:mo_money_app/local_delegate/share_preferences/preferences_req_delegate_impl.dart'
    as _i13;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import 'app_module.dart' as _i24;

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
  gh.factory<_i5.MessageService>(() =>
      _i6.MessageServiceImpl(reqDelegate: gh<_i3.AssetJsonReqDelegate>()));
  await gh.factoryAsync<_i7.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i8.TransactionsService>(() =>
      _i9.TransactionsServiceImpl(reqDelegate: gh<_i3.AssetJsonReqDelegate>()));
  gh.factory<_i10.MessageRepository>(() =>
      _i11.MessageRepositoryImpl(messageService: gh<_i5.MessageService>()));
  gh.factory<_i12.PreferencesReqDelegate>(() => _i13.PreferencesReqDelegateImpl(
      preferences: gh<_i7.SharedPreferences>()));
  gh.factory<_i14.TransactionRepository>(() => _i15.TransactionRepositoryImpl(
      transactionService: gh<_i8.TransactionsService>()));
  gh.factory<_i16.GetMessagesBloc>(
      () => _i16.GetMessagesBloc(repository: gh<_i10.MessageRepository>()));
  gh.factory<_i17.GetTransactionsBloc>(() =>
      _i17.GetTransactionsBloc(repository: gh<_i14.TransactionRepository>()));
  gh.factory<_i18.LoginService>(() =>
      _i19.LoginServiceImpl(reqDelegate: gh<_i12.PreferencesReqDelegate>()));
  gh.factory<_i20.LoginRepository>(
      () => _i21.LoginRepositoryImpl(loginService: gh<_i18.LoginService>()));
  gh.factory<_i22.GetLoginBloc>(
      () => _i22.GetLoginBloc(repository: gh<_i20.LoginRepository>()));
  gh.factory<_i23.GetProfileBloc>(
      () => _i23.GetProfileBloc(repository: gh<_i20.LoginRepository>()));
  return getIt;
}

class _$AppModule extends _i24.AppModule {}
