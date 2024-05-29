import 'package:flutter/material.dart';
import 'package:mo_money_app/features/transactions/widget/transaction_list_view_widget.dart';

import '../../../shared_components/widget/loader/app_loading_widget.dart';
import '../../../shared_components/widget/screen/failure_widget.dart';
import '../../common/result_status.dart';
import '../bloc/get_transactions_state.dart';

class TransactionBodyWidget extends StatelessWidget {
  final GetTransactionsState state;

  const TransactionBodyWidget(
      {Key? key = const Key('transactionBodyWidget'), required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case ResultStatus.init:
        return const AppLoadingWidget();
      case ResultStatus.done:
        return TransactionListViewWidget(transactions: state.transactions);
      default:
        return const FailureWidget();
    }
  }
}
