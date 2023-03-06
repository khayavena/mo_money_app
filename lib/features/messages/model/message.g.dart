// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message()
  ..date = json['date'] as String
  ..message = json['message'] as String;

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'date': instance.date,
      'message': instance.message,
    };
