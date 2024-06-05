import 'package:common/shared_components/util/NetworkHelper.dart';
import 'package:datasource/http_delegate/http_delegate_exception.dart';
import 'package:datasource/local_delegate/asset/asset_delegate_general_exception.dart';
import 'package:datasource/transactions/local/local_transaction_datasource.dart';
import 'package:datasource/transactions/remote/remote_transaction_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:model/transactions/card_detail.dart';
import 'package:model/transactions/transaction.dart';
import 'package:repository/transactions/transaction_repository.dart';


@Injectable(as: TransactionRepository)
class TransactionRepositoryImpl implements TransactionRepository {
  final LocalTransactionsDataSource transactionService;
  final RemoteTransactionsDataSource remoteTransactionsService;
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

  @override
  Future<CardDetail> getCardDetail() {
    // TODO: implement getCardDetail
    throw UnimplementedError();
  }
}
