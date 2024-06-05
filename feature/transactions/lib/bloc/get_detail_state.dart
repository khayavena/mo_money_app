import 'package:common/result_status.dart';
import 'package:model/transactions/card_detail.dart';

class GetCardDetailState {
  ResultStatus status;
  List<CardDetail> transactions = [];
  CardDetail cardDetail;

  GetCardDetailState({this.status = ResultStatus.init, required this.cardDetail});

  GetCardDetailState updateWith(
      {required ResultStatus state, required CardDetail results}) {
    return GetCardDetailState(status: state, cardDetail: results);
  }
}
