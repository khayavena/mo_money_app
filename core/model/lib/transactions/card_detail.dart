import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CardDetail {
  late String name;
  late String bank;
  late String account;
  late String status;
  late String expiry;
  CardDetail();
  CardDetail.copyWith();
}
