import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
class User {
  late String username;
  late String password;

  User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User();

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User.copyWith({required this.username, required this.password});
}
