import 'package:mo_money_app/features/messages/model/message.dart';

abstract class RemoteMessagesService {
  Future<List<Message>> getMessages();
}
