import 'package:flutter/material.dart';

import '../../../shared_components/util/cusmtom_colors.dart';

class CardTableWidget extends StatelessWidget {
  final String? name;

  const CardTableWidget(
      {Key? key = const Key('cardTableWidget'), required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entries = mapUserName(name ?? "");
    List<Widget> list = [];
    for (final entry in entries.entries) {
      list.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: Row(children: [
            Expanded(
                flex: 3,
                child: Text(
                  entry.key,
                  style: const TextStyle(
                      color: tertiaryColorLight,
                      fontSize: 16,
                      letterSpacing: 0.01),
                )),
            Expanded(
              flex: 7,
              child: Text(
                entry.value,
                style: const TextStyle(
                    color: tertiaryColorBlack,
                    fontSize: 16,
                    letterSpacing: 0.0),
              ),
            )
          ]),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 33, right: 33),
      child: Column(children: list),
    );
  }

  Map<String, String> mapUserName(String name) => {
        "Name": name,
        "Bank": "Momentum Money",
        "Account": "*** *** *** 2138",
        "Status": "active",
        "Expiry": "04/2025",
      };
}
