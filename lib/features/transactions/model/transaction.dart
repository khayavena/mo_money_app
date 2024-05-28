import 'package:json_annotation/json_annotation.dart';


part 'transaction.g.dart';

@JsonSerializable()
class Transaction{
  @JsonKey(name: "_id")
  late String id;
  late String name;
  late String description;
  late String icon;
  late int amount;
  Transaction();

  Transaction fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
