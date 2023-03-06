import 'package:json_annotation/json_annotation.dart';

import '../../../http_delegate/base_json_mapper.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseJsonMapper<User> {
  late String username;
  late String password;

  User();

  @override
  User create() => User();

  @override
  User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({required String username, required String password}) {
    this.username = username;
    this.password = password;
    return this;
  }
}
