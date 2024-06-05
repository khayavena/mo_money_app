import 'package:common/result_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:model/transactions/card_detail.dart';
import 'package:repository/transactions/transaction_repository.dart';
import 'package:transactions/bloc/get_detail_state.dart';

import 'get_card_detail_event.dart';

@Injectable()
class GetCardDetailBloc extends Bloc<GetCardDetailEvent, GetCardDetailState> {
  final TransactionRepository repository;

  GetCardDetailBloc({required this.repository})
      : super(GetCardDetailState(cardDetail: CardDetail())) {
    on<GetCardDetailEvent>((event, emit) async {
      emit(await _getCardDetailToState(event));
    });
  }

  Future<GetCardDetailState> _getCardDetailFailureToState() async {
    return state.updateWith(state: ResultStatus.failed, results: CardDetail());
  }

  Future<GetCardDetailState> _getCardDetailToState(
      GetCardDetailEvent event) async {
    final results = await repository.getCardDetail();
    if (results != null) {
      return _getCardDetailFailureToState();
    }
    return state.updateWith(state: ResultStatus.done, results: results);
  }
}
