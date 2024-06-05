
abstract class HttpReqDelegate {
  Future<dynamic> get(String endPoint,
      {Map<String, dynamic>? params});


  Future<dynamic> post(String endPoint,
      {Map<String, dynamic>? params,
      required Map<String, dynamic> requestBody});
}
