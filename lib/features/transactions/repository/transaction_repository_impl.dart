import 'package:injectable/injectable.dart';
import 'package:mo_money_app/features/transactions/repository/transaction_repository.dart';
import 'package:mo_money_app/local_delegate/asset/asset_delegate_general_exception.dart';

import '../data_source/transaction_service.dart';
import '../model/transaction.dart';
@Injectable(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionsService transactionService;

  TransactionRepositoryImpl({required this.transactionService});

  @override
  Future<List<Transaction>> getTransactions() async {
    try {
      final posts = transactionService.getTransactions();
      return posts;
    } on AssetDelegateGeneralException {
      return [];
    }
  }
}
