import 'dart:developer';

import 'package:dio/dio.dart';



class DioClient {
  final Dio dio = Dio();

  Dio getInstance(
      {required String baseUrl,
      bool debugMode = false,
      required List<Interceptor> interceptors}) {
    return dio
      ..options = BaseOptions(
        baseUrl: baseUrl,
      )
      ..interceptors.addAll(interceptors)
      ..interceptors.add(
        LogInterceptor(
          request: debugMode,
          requestHeader: debugMode,
          responseHeader: debugMode,
          responseBody: debugMode,
          requestBody: debugMode,
          logPrint: (value) {
            log(value as String);
          },
        ),
      );
  }
}
