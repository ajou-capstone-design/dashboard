// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Emg {
  int get id;
  int get userId;
  double get time;
  double get value;
  DateTime get createdAt;

  /// Create a copy of Emg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmgCopyWith<Emg> get copyWith =>
      _$EmgCopyWithImpl<Emg>(this as Emg, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Emg &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, time, value, createdAt);

  @override
  String toString() {
    return 'Emg(id: $id, userId: $userId, time: $time, value: $value, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $EmgCopyWith<$Res> {
  factory $EmgCopyWith(Emg value, $Res Function(Emg) _then) = _$EmgCopyWithImpl;
  @useResult
  $Res call(
      {int id, int userId, double time, double value, DateTime createdAt});
}

/// @nodoc
class _$EmgCopyWithImpl<$Res> implements $EmgCopyWith<$Res> {
  _$EmgCopyWithImpl(this._self, this._then);

  final Emg _self;
  final $Res Function(Emg) _then;

  /// Create a copy of Emg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? time = null,
    Object? value = null,
    Object? createdAt = null,
  }) {
    return _then(Emg(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
