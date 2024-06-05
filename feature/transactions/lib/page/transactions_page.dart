import 'dart:developer';

import 'package:common/result_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/get_transactions_bloc.dart';
import '../bloc/get_transactions_event.dart';
import '../bloc/get_transactions_state.dart';
import '../constants/transaction_analytics_events.dart';
import '../widget/transaction_body_widget.dart';
class TransactionListPage extends StatefulWidget {
  const TransactionListPage({super.key,  this.title = ""});

  final String title;

  @override
  State<TransactionListPage> createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<GetTransactionsBloc>().add(GetTransactionsEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GetTransactionsBloc, GetTransactionsState>(
          listener: (context, state) {
        switch (state.status) {
          case ResultStatus.init:
            log(TransactionAnalyticsEvents.transactionInitEvent);
            break;
          case ResultStatus.done:
            log(TransactionAnalyticsEvents.transactionDoneEvent);
            break;
          case ResultStatus.failed:
            log(TransactionAnalyticsEvents.transactionFailedEvent);
            break;
        }
      }, builder: (context, state) {
        return TransactionBodyWidget(state: state);
      }),
    );
  }
}
