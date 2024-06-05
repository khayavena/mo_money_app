import 'package:model/transactions/transaction.dart';


abstract class LocalTransactionsDataSource {
  Future<List<Transaction>> getTransactions();
}
