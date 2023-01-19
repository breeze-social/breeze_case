import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  /// The uuid of this user.
  final String id;

  /// The moment the match was created.
  final DateTime createdAt;

  /// Constructor for a [User] containing it's [id].
  const User({required this.id, required this.createdAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() => toJson().toString();
}
