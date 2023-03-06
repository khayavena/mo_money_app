import 'package:flutter/material.dart';
import 'package:mo_money_app/features/transactions/widget/transaction_item_card_widget.dart';

import '../model/transaction.dart';

class TransactionListViewWidget extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionListViewWidget(
      {Key key = const Key('transactionListViewWidget'),
      required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 30.0, bottom: 16),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: transactions.length,
          itemBuilder: (BuildContext context, int index) {
            return TransactionItemCardWidget(
              transaction: transactions[index],
            );
          }),
    );
  }
}
