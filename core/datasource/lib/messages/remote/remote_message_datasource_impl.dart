import 'package:datasource/messages/remote/remote_message_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:model/messages/message.dart';

import '../../http_delegate/http_req_delegate.dart';

@Injectable(as: RemoteMessagesDataSource)
class RemoteMessagesDataSourceImpl extends RemoteMessagesDataSource {
  final HttpReqDelegate httpReqDelegate;

  RemoteMessagesDataSourceImpl({required this.httpReqDelegate});

  @override
  Future<List<Message>> getMessages() async {
    try {
      dynamic response = await httpReqDelegate.get("/messages");
      return List<Message>.from(
          response.map((element) => Message().fromJson(element)));
    } catch (e) {
      rethrow;
    }
  }
}


