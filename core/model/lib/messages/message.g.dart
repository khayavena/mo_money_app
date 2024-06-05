// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message()
  ..id = json['_id'] as String
  ..date = json['date'] as String
  ..message = json['message'] as String;

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      '_id': instance.id,
      'date': instance.date,
      'message': instance.message,
    };
