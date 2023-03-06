import 'package:json_annotation/json_annotation.dart';

import '../../../http_delegate/base_json_mapper.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction extends BaseJsonMapper<Transaction> {
  late String name;
  late String description;
  late String icon;
  late int amount;

  Transaction();

  @override
  Transaction create() => Transaction();

  @override
  Transaction fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
