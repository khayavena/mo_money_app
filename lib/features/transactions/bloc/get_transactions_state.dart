import 'package:mo_money_app/features/common/result_status.dart';

import '../model/transaction.dart';

class GetTransactionsState {
  ResultStatus status;
  List<Transaction> transactions = [];

  GetTransactionsState(
      {this.status = ResultStatus.init, this.transactions = const []});

  GetTransactionsState updateWith(
      {required ResultStatus state, required List<Transaction> results}) {
    return GetTransactionsState(status: state, transactions: results);
  }
}
