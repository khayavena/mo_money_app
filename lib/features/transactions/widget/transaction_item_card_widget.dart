import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared_components/util/cusmtom_colors.dart';
import '../../../shared_components/widget/button/currency_text_widget.dart';
import '../model/transaction.dart';

class TransactionItemCardWidget extends StatelessWidget {
  final Transaction transaction;

  const TransactionItemCardWidget(
      {super.key = const Key("transactionItemCardWidget"),
      required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 0,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
      leading: SvgPicture.asset(
        height: 44,
        width: 44,
        transaction.icon,
      ),
      subtitle: Text(
        transaction.description,
        style: const TextStyle(fontSize: 13),
      ),
      trailing: CurrencyTextWidget(
        value: transaction.amount,
        fontSize: 16,
        color: tertiaryColorDark,
      ),
      title: Text(transaction.name,
          style: const TextStyle(fontSize: 16, color: secondaryColorDark)),
    );
  }
}
