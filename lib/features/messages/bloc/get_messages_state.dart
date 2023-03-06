import 'package:mo_money_app/features/comon/result_status.dart';

import '../model/message.dart';

class GetMessagesState {
  ResultStatus status;
  List<Message> messages = [];

  GetMessagesState({this.status = ResultStatus.init, this.messages = const []});

  GetMessagesState updateWith(
      {required ResultStatus state, required List<Message> results}) {
    return GetMessagesState(status: state, messages: results);
  }
}
