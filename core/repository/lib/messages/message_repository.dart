
import 'package:model/messages/message.dart';

abstract class MessageRepository {
  Future<List<Message>> getMessages();
}
