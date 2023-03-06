import '../model/transaction.dart';

abstract class TransactionsService {
  Future<List<Transaction>> getTransactions();
}
