import '../model/message.dart';

abstract class MessageRepository {
  Future<List<Message>> getMessages();
}
