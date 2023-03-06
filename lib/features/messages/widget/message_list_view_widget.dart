import 'package:flutter/material.dart';

import '../../../shared_components/util/amount_helper.dart';
import '../../../shared_components/util/cusmtom_colors.dart';
import '../model/message.dart';

class MessageListViewWidget extends StatelessWidget {
  final List<Message> messages;

  const MessageListViewWidget(
      {Key key = const Key('postsPage'), required this.messages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 90,
            margin: const EdgeInsets.only(
              top: 10,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(
                20,
              ),
              boxShadow: const [
                BoxShadow(
                  color: tertiaryColorLighter,
                  offset: Offset(1, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ListTile(
              subtitle: Text(
                messages[index].message,
                style: const TextStyle(
                    fontSize: 13,
                    color: tertiaryColorDark,
                    letterSpacing: 0.01),
              ),
              title: Text(
                AppHelper.formdate(messages[index].date),
                style: const TextStyle(fontSize: 12, color: tertiaryColorLight),
              ),
            ),
          );
        });
  }
}
