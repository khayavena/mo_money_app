import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared_components/util/cusmtom_colors.dart';
import '../../../shared_components/widget/button/back_button_widget.dart';
import '../../common/result_status.dart';
import '../bloc/get_messages_bloc.dart';
import '../bloc/get_messages_event.dart';
import '../bloc/get_messages_state.dart';
import '../constants/message_analytics_events.dart';
import '../widget/messages_body_widget.dart';
@RoutePage()
class MessageListPage extends StatefulWidget {
  const MessageListPage({super.key, required this.title});

  final String title;

  @override
  State<MessageListPage> createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<GetMessagesBloc>().add(GetMessagesEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Inbox",
              style: TextStyle(
                  color: secondaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.01),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: BlocConsumer<GetMessagesBloc, GetMessagesState>(
                  listener: (context, state) {
                switch (state.status) {
                  case ResultStatus.init:
                    log(MessageAnalyticsEvents.postsInitEvent);
                    break;
                  case ResultStatus.done:
                    log(MessageAnalyticsEvents.postsDoneEvent);
                    break;
                  case ResultStatus.failed:
                    log(MessageAnalyticsEvents.postsFailedEvent);
                    break;
                }
              }, builder: (context, state) {
                return MessagesBodyWidget(state: state);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
