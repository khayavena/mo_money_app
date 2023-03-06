import 'dart:convert';

import 'package:flutter/services.dart';

import '../../http_delegate/base_json_mapper.dart';
import 'asset_delegate_general_exception.dart';
import 'asset_json_req_delegate.dart';

class AssetJsonReqDelegateImpl implements AssetJsonReqDelegate {
  final AssetBundle service;

  AssetJsonReqDelegateImpl({required this.service});

  @override
  Future<T> get<T extends BaseJsonMapper>(String assetPath, T refType,
      {Map<String, dynamic>? params}) async {
    try {
      final result = await service.loadString(assetPath);
      return refType.fromJson(jsonDecode(result));
    } on Error catch (e) {
      throw AssetDelegateGeneralException(e);
    }
  }

  @override
  Future<List<T>> getList<T extends BaseJsonMapper>(
      String assetPath, T refType) async {
    try {
      final json = await service.loadString(assetPath);
      final results = List<T>.from(
          jsonDecode(json).map((e) => refType.create().fromJson(e)));
      return results;
    } on Error catch (e) {
      throw AssetDelegateGeneralException(e);
    }
  }
}
