import 'package:common/result_status.dart';
import 'package:common/shared_components/widget/loader/app_loading_widget.dart';
import 'package:common/shared_components/widget/screen/failure_widget.dart';
import 'package:flutter/material.dart';


import '../bloc/get_messages_state.dart';
import 'message_list_view_widget.dart';

class MessagesBodyWidget extends StatelessWidget {
  final GetMessagesState state;

  const MessagesBodyWidget(
      {Key? key = const Key('messagesBodyWidget'), required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case ResultStatus.init:
        return const AppLoadingWidget();
      case ResultStatus.done:
        return MessageListViewWidget(messages: state.messages);
      default:
        return const FailureWidget();
    }
  }
}
