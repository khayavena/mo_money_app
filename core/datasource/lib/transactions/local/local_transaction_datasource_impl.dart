import 'package:datasource/transactions/local/local_transaction_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:model/transactions/transaction.dart';

import '../../../../local_delegate/asset/asset_json_req_delegate.dart';

@Injectable(as: LocalTransactionsDataSource)
class LocalTransactionsDataSourceImpl implements LocalTransactionsDataSource {
  static const transactionSource = 'assets/data/transactions.json';
  final AssetJsonReqDelegate reqDelegate;

  LocalTransactionsDataSourceImpl({required this.reqDelegate});

  @override
  Future<List<Transaction>> getTransactions() async {
    try {
      final response = await reqDelegate.get(transactionSource);
      return List<Transaction>.from(
          response.map((element) => Transaction().fromJson(element)));
    } catch (e) {
      rethrow;
    }
  }
}
