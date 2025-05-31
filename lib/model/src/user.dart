import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class User with _$User {
  User({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime createdAt;

  Map<String, Object?> toJson() => _$UserToJson(this);
}
