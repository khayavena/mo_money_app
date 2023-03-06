import '../../http_delegate/base_json_mapper.dart';

abstract class AssetJsonReqDelegate {
  Future<T> get<T extends BaseJsonMapper>(String endPoint, T refType);

  Future<List<T>> getList<T extends BaseJsonMapper>(String endPoint, T refType);
}
