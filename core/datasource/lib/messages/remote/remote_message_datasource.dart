import 'package:model/messages/message.dart';

abstract class RemoteMessagesDataSource {
  Future<List<Message>> getMessages();
}
