
import '../../model/transaction.dart';

abstract class RemoteTransactionsService {
  Future<List<Transaction>> getTransactions();
}
