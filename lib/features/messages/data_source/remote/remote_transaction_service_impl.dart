import 'package:injectable/injectable.dart';
import 'package:mo_money_app/features/messages/data_source/remote/remote_transaction_service.dart';
import 'package:mo_money_app/features/messages/model/message.dart';
import 'package:mo_money_app/http_delegate/http_req_delegate.dart';

@Injectable(as: RemoteMessagesService)
class RemoteMessagesServiceImpl extends RemoteMessagesService {
  final HttpReqDelegate httpReqDelegate;

  RemoteMessagesServiceImpl({required this.httpReqDelegate});

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
