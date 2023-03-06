import '../model/message.dart';

abstract class MessageService {
  Future<List<Message>> getMessages();
}
