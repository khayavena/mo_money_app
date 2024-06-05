import 'package:common/result_status.dart';
import 'package:model/transactions/transaction.dart';


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
