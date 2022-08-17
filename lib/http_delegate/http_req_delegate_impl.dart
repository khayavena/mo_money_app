library http_delegate;

import 'package:dio/dio.dart';

import 'base_json_mapper.dart';
import 'http_delegate_exception.dart';
import 'http_delegate_general_exception.dart';
import 'http_req_delegate.dart';

class HttpReqDelegateImpl implements HttpReqDelegate {
  late final Dio client;

  HttpReqDelegateImpl({required Dio dioClient}) {
    client = dioClient;
  }

  @override
  Future<T> get<T extends BaseJsonMapper>(String endPoint, T refType,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await client.get(endPoint);
      final result = response.data;
      return refType.fromJson(result);
    } on DioError catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }

  @override
  Future<T> post<T extends BaseJsonMapper>(String endPoint, T refType,
      {Map<String, dynamic>? params,
      required Map<String, dynamic> requestBody}) async {
    try {
      final response = await client.post(endPoint, data: requestBody);
      final result = response.data;
      return refType.fromJson(result);
    } on DioError catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }

  @override
  Future<List<T>> getList<T extends BaseJsonMapper>(String endPoint, T refType,
      {Map<String, dynamic>? params}) async {
    try {
      final response = await client.get(endPoint);
      final json = response.data;
      final results =
          List<T>.from(json.map((e) => refType.create().fromJson(e)));
      return results;
    } on DioError catch (e) {
      throw HttpDelegateException(e);
    } on Error catch (e) {
      throw HttpDelegateGeneralException(e);
    }
  }
}
