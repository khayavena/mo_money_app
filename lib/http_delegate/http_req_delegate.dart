import 'base_json_mapper.dart';

abstract class HttpReqDelegate {
  Future<T> get<T extends BaseJsonMapper>(String endPoint, T refType,
      {Map<String, dynamic>? params});

  Future<List<T>> getList<T extends BaseJsonMapper>(String endPoint, T refType,
      {Map<String, dynamic>? params});

  Future<T> post<T extends BaseJsonMapper>(String endPoint, T refType,
      {Map<String, dynamic>? params,
      required Map<String, dynamic> requestBody});
}
