import 'package:injectable/injectable.dart';
import 'package:model/messages/message.dart';

import '../../../../local_delegate/asset/asset_json_req_delegate.dart';
import 'local_message_datasource.dart';

@Injectable(as: LocalMessageDataSource)
class LocalMessageDatasourceImpl implements LocalMessageDataSource {
  static const transactionSource = 'assets/data/notifications.json';
  final AssetJsonReqDelegate reqDelegate;

  LocalMessageDatasourceImpl({required this.reqDelegate});

  @override
  Future<List<Message>> getMessages() async {
    try {
      dynamic response = await reqDelegate.get(transactionSource);
      return List<Message>.from(
          response.map((element) => Message().fromJson(element)));
    } catch (e) {
      rethrow;
    }
  }
}
