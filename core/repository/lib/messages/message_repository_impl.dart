import 'package:common/shared_components/util/NetworkHelper.dart';
import 'package:datasource/http_delegate/http_delegate_general_exception.dart';
import 'package:datasource/local_delegate/asset/asset_delegate_general_exception.dart';
import 'package:datasource/messages/local/local_message_datasource.dart';
import 'package:datasource/messages/remote/remote_message_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:model/messages/message.dart';

import 'message_repository.dart';

@Injectable(as: MessageRepository)
class MessageRepositoryImpl implements MessageRepository {
  final LocalMessageDataSource messageService;
  final RemoteMessagesDataSource remoteMessagesDataSource;
  final NetworkHelper networkHelper;

  MessageRepositoryImpl(
      {required this.messageService,
      required this.remoteMessagesDataSource,
      required this.networkHelper});

  @override
  Future<List<Message>> getMessages() async {
    try {
      final messages = await networkHelper.isNetworkConnected().then(
          (isConnected) => isConnected
              ? remoteMessagesDataSource.getMessages()
              : messageService.getMessages());
      return messages;
    } on AssetDelegateGeneralException {
      return [];
    } on HttpDelegateGeneralException {
      return [];
    }
  }
}
