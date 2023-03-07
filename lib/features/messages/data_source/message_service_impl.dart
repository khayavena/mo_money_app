import 'package:injectable/injectable.dart';

import '../../../local_delegate/asset/asset_json_req_delegate.dart';
import '../model/message.dart';
import 'message_service.dart';
@Injectable(as: MessageService)
class MessageServiceImpl implements MessageService {
  static const transactionSource = 'assets/data/notifications.json';
  final AssetJsonReqDelegate reqDelegate;

  MessageServiceImpl({required this.reqDelegate});

  @override
  Future<List<Message>> getMessages() async {
    final posts = reqDelegate.getList<Message>(transactionSource, Message());
    return posts;
  }
}
