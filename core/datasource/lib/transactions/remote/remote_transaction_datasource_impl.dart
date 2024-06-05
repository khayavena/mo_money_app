import 'package:datasource/transactions/remote/remote_transaction_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:model/transactions/transaction.dart';

import '../../http_delegate/http_req_delegate.dart';


@Injectable(as: RemoteTransactionsDataSource)
class RemoteTransactionsDatasourceImpl extends RemoteTransactionsDataSource {
  final HttpReqDelegate httpReqDelegate;

  RemoteTransactionsDatasourceImpl({required this.httpReqDelegate});

  @override
  Future<List<Transaction>> getTransactions() async {
    try {
      final response = await httpReqDelegate.get("/transactions");
      return List<Transaction>.from(
          response.map((element) => Transaction().fromJson(element)));
    } catch (e) {
      rethrow;
    }
  }
}
