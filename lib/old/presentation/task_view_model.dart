import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_next_page/old/entity/task.dart';

final taskProvider = StateNotifierProvider<TaskStateNotifier, Task>((ref) => TaskStateNotifier());

class TaskStateNotifier extends StateNotifier<Task> {
  TaskStateNotifier() : super(const Task(firstName: '', lastName: ''));

  void updateTask(Task task) {
    state = task;
  }
}