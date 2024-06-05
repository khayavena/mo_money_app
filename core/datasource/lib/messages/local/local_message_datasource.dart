import 'package:model/messages/message.dart';


abstract class LocalMessageDataSource {
  Future<List<Message>> getMessages();
}
