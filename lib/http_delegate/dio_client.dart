import 'dart:developer';

import 'package:dio/dio.dart';

class DioClient {
  static Dio getInstance(
      {required String baseUrl,
      bool debugMode = true,
      required List<Interceptor> interceptors}) {
    return Dio(BaseOptions(
      baseUrl: baseUrl,
    ))
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
