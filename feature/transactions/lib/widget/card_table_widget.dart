import 'package:common/shared_components/util/cusmtom_colors.dart';
import 'package:flutter/material.dart';
import 'package:model/transactions/card_detail.dart';

class CardTableWidget extends StatelessWidget {
  final CardDetail cardDetail;

  const CardTableWidget(
      {super.key = const Key('cardTableWidget'), required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    final entries = mapUserName(cardDetail.name ?? "");
    List<Widget> list = [];
    // for (final entry in entries.entries) {
    //   list.add(
    //
    //   );
    // }
    return Padding(
      padding: const EdgeInsets.only(left: 33, right: 33),
      child: Column(children: [
        cardItem("Name", cardDetail.name),
        cardItem("Bank", cardDetail.bank),
        cardItem("Account", cardDetail.account),
        cardItem("Status", cardDetail.status),
        cardItem("Expiry", cardDetail.expiry),
      ]),
    );
  }

  Widget cardItem(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Row(children: [
        Expanded(
            flex: 3,
            child: Text(
              key,
              style: const TextStyle(
                  color: tertiaryColorLight, fontSize: 16, letterSpacing: 0.01),
            )),
        Expanded(
          flex: 7,
          child: Text(
            value,
            style: const TextStyle(
                color: tertiaryColorBlack, fontSize: 16, letterSpacing: 0.0),
          ),
        )
      ]),
    );
  }

  Map<String, String> mapUserName(String name) => {
        "Name": name,
        "Bank": "Mo Money",
        "Account": "*** *** *** 2138",
        "Status": "active",
        "Expiry": "04/2025",
      };
}
