import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_money_app/features/comon/result_status.dart';

import '../repository/transaction_repository.dart';
import 'get_transactions_event.dart';
import 'get_transactions_state.dart';

class GetTransactionsBloc
    extends Bloc<GetTransactionsEvent, GetTransactionsState> {
  final TransactionRepository repository;

  GetTransactionsBloc({required this.repository})
      : super(GetTransactionsState()) {
    on<GetTransactionsEvent>((event, emit) async {
      emit(await _getTransactionsToState(event));
    });
  }

  Future<GetTransactionsState> _getTransactionsFailureToState() async {
    return state.updateWith(state: ResultStatus.failed, results: []);
  }

  Future<GetTransactionsState> _getTransactionsToState(
      GetTransactionsEvent event) async {
    final results = await repository.getTransactions();
    if (results.isEmpty) {
      return _getTransactionsFailureToState();
    }
    return state.updateWith(state: ResultStatus.done, results: results);
  }
}
