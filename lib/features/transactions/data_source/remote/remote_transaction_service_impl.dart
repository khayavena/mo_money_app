import 'package:injectable/injectable.dart';
import 'package:mo_money_app/features/transactions/data_source/remote/remote_transaction_service.dart';
import 'package:mo_money_app/http_delegate/http_req_delegate.dart';

import '../../model/transaction.dart';

@Injectable(as: RemoteTransactionsService)
class RemoteTransactionsServiceImpl extends RemoteTransactionsService {
  final HttpReqDelegate httpReqDelegate;

  RemoteTransactionsServiceImpl({required this.httpReqDelegate});

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
