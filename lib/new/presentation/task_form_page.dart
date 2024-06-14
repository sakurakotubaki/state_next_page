import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_next_page/new/presentation/next_page.dart';
import 'package:state_next_page/new/presentation/task_view_model.dart';

class TaskFormPage extends ConsumerStatefulWidget {
  const TaskFormPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends ConsumerState<TaskFormPage> {
  final _formKey = GlobalKey<FormState>();

  final fastNameController = TextEditingController();
  final lastNameController = TextEditingController();
  bool isDone = false;

  @override
  void dispose() {
    fastNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final task = ref.watch(taskViewModelNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('入力画面G')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: fastNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
              onSaved: (value) {
                ref
                    .read(taskViewModelNotifierProvider.notifier)
                    .updateTask(task.copyWith(firstName: value!));
              },
            ),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
              onSaved: (value) {
                ref
                    .read(taskViewModelNotifierProvider.notifier)
                    .updateTask(task.copyWith(lastName: value!));
              },
            ),
            CheckboxListTile(
              title: const Text('Check me'),
              value: task.isDone,
              onChanged: (value) {
                isDone = value!;
                ref
                    .read(taskViewModelNotifierProvider.notifier)
                    .updateTask(task.copyWith(isDone: value));
              },
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ref.read(taskViewModelNotifierProvider.notifier).updateTask(
                        task.copyWith(
                          firstName: fastNameController.text,
                          lastName: lastNameController.text,
                          isDone: isDone,
                        ),
                      );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NextPage()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
