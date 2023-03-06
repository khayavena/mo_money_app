import 'package:json_annotation/json_annotation.dart';

import '../../../http_delegate/base_json_mapper.dart';

part 'message.g.dart';

@JsonSerializable()
class Message extends BaseJsonMapper<Message> {
  late String date;
  late String message;

  Message();

  @override
  Message create() => Message();

  @override
  Message fromJson(Map<String, dynamic> json) {
    final value = _$MessageFromJson(json);
    return value;
  }

  @override
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
