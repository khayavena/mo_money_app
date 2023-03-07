import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../http_delegate/base_json_mapper.dart';
import 'asset_delegate_general_exception.dart';
import 'asset_json_req_delegate.dart';

@Injectable(as: AssetJsonReqDelegate)
class AssetJsonReqDelegateImpl implements AssetJsonReqDelegate {
  AssetJsonReqDelegateImpl();

  @override
  Future<T> get<T extends BaseJsonMapper>(String assetPath, T refType,
      {Map<String, dynamic>? params}) async {
    try {
      final result = await rootBundle.loadString(assetPath);
      return refType.fromJson(jsonDecode(result));
    } on Error catch (e) {
      throw AssetDelegateGeneralException(e);
    }
  }

  @override
  Future<List<T>> getList<T extends BaseJsonMapper>(
      String assetPath, T refType) async {
    try {
      final json = await rootBundle.loadString(assetPath);
      final results = List<T>.from(
          jsonDecode(json).map((e) => refType.create().fromJson(e)));
      return results;
    } on Error catch (e) {
      throw AssetDelegateGeneralException(e);
    }
  }
}
