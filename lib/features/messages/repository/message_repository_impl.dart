import 'package:injectable/injectable.dart';

import '../../../local_delegate/asset/asset_delegate_general_exception.dart';
import '../data_source/message_service.dart';
import '../model/message.dart';
import 'message_repository.dart';
@Injectable(as: MessageRepository)
class MessageRepositoryImpl implements MessageRepository {
  final MessageService messageService;

  MessageRepositoryImpl({required this.messageService});

  @override
  Future<List<Message>> getMessages() async {
    try {
      final messages = await messageService.getMessages();
      return messages;
    } on AssetDelegateGeneralException {
      return [];
    }
  }
}
