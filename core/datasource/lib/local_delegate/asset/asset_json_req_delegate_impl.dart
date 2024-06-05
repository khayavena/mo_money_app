import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'asset_delegate_general_exception.dart';
import 'asset_json_req_delegate.dart';

@Injectable(as: AssetJsonReqDelegate)
class AssetJsonReqDelegateImpl implements AssetJsonReqDelegate {
  @override
  Future<dynamic> get(String assetPath, {Map<String, dynamic>? params}) async {
    try {
      final result = await rootBundle.loadString(assetPath);
      return jsonDecode(result);
    } on Error catch (e) {
      throw AssetDelegateGeneralException(e);
    }
  }
}
