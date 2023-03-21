import 'package:injectable/injectable.dart';
import 'package:mo_money_app/features/messages/data_source/remote/remote_transaction_service.dart';
import 'package:mo_money_app/shared_components/util/NetworkHelper.dart';

import '../../../http_delegate/http_delegate_general_exception.dart';
import '../../../local_delegate/asset/asset_delegate_general_exception.dart';
import '../data_source/message_service.dart';
import '../model/message.dart';
import 'message_repository.dart';

@Injectable(as: MessageRepository)
class MessageRepositoryImpl implements MessageRepository {
  final MessageService messageService;
  final RemoteMessagesService remoteMessagesService;
  final NetworkHelper networkHelper;

  MessageRepositoryImpl(
      {required this.messageService,
      required this.remoteMessagesService,
      required this.networkHelper});

  @override
  Future<List<Message>> getMessages() async {
    try {
      final messages = await networkHelper.isNetworkConnected().then(
          (isConnected) => isConnected
              ? remoteMessagesService.getMessages()
              : messageService.getMessages());
      return messages;
    } on AssetDelegateGeneralException {
      return [];
    } on HttpDelegateGeneralException {
      return [];
    }
  }
}
