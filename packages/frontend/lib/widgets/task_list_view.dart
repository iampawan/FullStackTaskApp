import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].title),
          trailing: tasks[index].isCompleted ? const Icon(Icons.done) : null,
        );
      },
    );
  }
}
