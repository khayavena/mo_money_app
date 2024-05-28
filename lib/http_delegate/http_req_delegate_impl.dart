library http_delegate;

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'http_delegate_exception.dart';
import 'http_delegate_general_exception.dart';
import 'http_req_delegate.dart';

@Injectable(as: HttpReqDelegate)
class HttpReqDelegateImpl implements HttpReqDelegate {
  late final Dio client;

  HttpReqDelegateImpl({required Dio dioClient}) {
    client = dioClient;
  }

  @override
  Future get(String endPoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await client.get(endPoint);
      final result = response.data;
      return result;
    } on DioException catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }

  @override
  Future<dynamic> post(String endPoint,
      {Map<String, dynamic>? params,
      required Map<String, dynamic> requestBody}) async {
    try {
      final response = await client.post(endPoint, data: requestBody);
      return response.data;
    } on DioException catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }
}
