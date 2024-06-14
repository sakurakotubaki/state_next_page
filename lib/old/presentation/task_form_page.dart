import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_next_page/old/presentation/next_page.dart';
import 'package:state_next_page/old/presentation/task_view_model.dart';

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
    final task = ref.watch(taskProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('入力画面')),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: fastNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
              onSaved: (value) {
                ref
                    .read(taskProvider.notifier)
                    .updateTask(task.copyWith(firstName: value!));
              },
            ),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
              onSaved: (value) {
                ref
                    .read(taskProvider.notifier)
                    .updateTask(task.copyWith(lastName: value!));
              },
            ),
            CheckboxListTile(
              title: const Text('Check me'),
              value: task.isDone,
              onChanged: (value) {
                isDone = value!;
                ref
                    .read(taskProvider.notifier)
                    .updateTask(task.copyWith(isDone: value));
              },
            ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ref.read(taskProvider.notifier).updateTask(
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
