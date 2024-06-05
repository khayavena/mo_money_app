
import 'package:model/transactions/card_detail.dart';
import 'package:model/transactions/transaction.dart';

abstract class TransactionRepository {
  Future<List<Transaction>> getTransactions();
  Future<CardDetail> getCardDetail();
}
