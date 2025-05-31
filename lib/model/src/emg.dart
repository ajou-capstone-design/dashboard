import 'package:freezed_annotation/freezed_annotation.dart';

part 'emg.freezed.dart';
part 'emg.g.dart';

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
class Emg with _$Emg {
  Emg({
    required this.id,
    required this.userId,
    required this.time,
    required this.value,
    required this.createdAt,
  });

  factory Emg.fromJson(Map<String, Object?> json) => _$EmgFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final double time;
  @override
  final double value;
  @override
  final DateTime createdAt;

  Map<String, Object?> toJson() => _$EmgToJson(this);
}
