// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction()
  ..id = json['_id'] as String
  ..name = json['name'] as String
  ..description = json['description'] as String
  ..icon = json['icon'] as String
  ..amount = (json['amount'] as num).toInt();

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'amount': instance.amount,
    };
