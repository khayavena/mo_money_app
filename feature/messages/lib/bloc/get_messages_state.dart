import 'package:common/result_status.dart';
import 'package:model/messages/message.dart';


class GetMessagesState {
  ResultStatus status;
  List<Message> messages = [];

  GetMessagesState({this.status = ResultStatus.init, this.messages = const []});

  GetMessagesState updateWith(
      {required ResultStatus state, required List<Message> results}) {
    return GetMessagesState(status: state, messages: results);
  }
}
