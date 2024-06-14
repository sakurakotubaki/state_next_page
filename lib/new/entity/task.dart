import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String firstName,
    required String lastName,
    @Default(false) isDone,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json)
      => _$TaskFromJson(json);
}