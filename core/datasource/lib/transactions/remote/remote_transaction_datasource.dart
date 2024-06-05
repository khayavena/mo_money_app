
import 'package:model/transactions/transaction.dart';


abstract class RemoteTransactionsDataSource {
  Future<List<Transaction>> getTransactions();
}
