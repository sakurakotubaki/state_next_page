import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_next_page/old/presentation/task_view_model.dart';

class NextPage extends ConsumerWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('入力確認画面')),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          children: <Widget>[
            Text('名字: ${task.firstName}'),
            Text('名前: ${task.lastName}'),
            Checkbox(
              value: task.isDone,
              onChanged: (value) {               
              },
            ),
          ],
        ),
      ),
    );
  }
}