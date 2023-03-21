import 'package:injectable/injectable.dart';
import 'package:mo_money_app/features/transactions/repository/transaction_repository.dart';
import 'package:mo_money_app/local_delegate/asset/asset_delegate_general_exception.dart';

import '../../../http_delegate/http_delegate_exception.dart';
import '../../../shared_components/util/NetworkHelper.dart';
import '../data_source/local/transaction_service.dart';
import '../data_source/remote/remote_transaction_service.dart';
import '../model/transaction.dart';

@Injectable(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionsService transactionService;
  final RemoteTransactionsService remoteTransactionsService;
  final NetworkHelper networkHelper;

  TransactionRepositoryImpl(
      {required this.transactionService,
      required this.remoteTransactionsService,
      required this.networkHelper});

  @override
  Future<List<Transaction>> getTransactions() async {
    try {
      final results = await networkHelper.isNetworkConnected().then(
          (isConnected) => isConnected
              ? remoteTransactionsService.getTransactions()
              : transactionService.getTransactions());
      return results;
    } on AssetDelegateGeneralException {
      return [];
    } on HttpDelegateException {
      return [];
    }
  }
}
