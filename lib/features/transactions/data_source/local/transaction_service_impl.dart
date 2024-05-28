import 'package:injectable/injectable.dart';
import 'package:mo_money_app/features/transactions/data_source/local/transaction_service.dart';

import '../../../../local_delegate/asset/asset_json_req_delegate.dart';
import '../../model/transaction.dart';

@Injectable(as: TransactionsService)
class TransactionsServiceImpl implements TransactionsService {
  static const transactionSource = 'assets/data/transactions.json';
  final AssetJsonReqDelegate reqDelegate;

  TransactionsServiceImpl({required this.reqDelegate});

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
