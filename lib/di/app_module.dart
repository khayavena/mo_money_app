import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mo_money_app/http_delegate/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../env/env_config.dart';

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences async {
    return SharedPreferences.getInstance();
  }

  @lazySingleton
  Dio get getDio =>
      DioClient.getInstance(baseUrl: EnvConfig.getBaseUrl(), interceptors: []);
}
