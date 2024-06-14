import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_next_page/new/entity/task.dart';

part 'task_view_model.g.dart';

@riverpod
class TaskViewModelNotifier extends _$TaskViewModelNotifier {
  @override
  Task build() {
    return const Task(firstName: '', lastName: '');
  }

  void updateTask(Task task) {
    state = task;
  }
}