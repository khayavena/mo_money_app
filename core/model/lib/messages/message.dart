import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: "_id")
  late String id;
  late String date;
  late String message;

  Message();



  Message fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);



  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
