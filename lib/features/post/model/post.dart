import 'package:json_annotation/json_annotation.dart';

import '../../../http_delegate/base_json_mapper.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends BaseJsonMapper<Post> {
  late int userId;
  late int id;
  late String title;
  late String body;

  Post();

  @override
  Post create() => Post();

  @override
  Post fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
