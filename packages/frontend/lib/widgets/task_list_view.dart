import 'package:flutter/material.dart';
import 'package:frontend/core/mutations/get_all_tasks.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store/task_store.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return VxBuilder(
      mutations: const {GetAllTasksMutation},
      builder: (context, store, status) {
        final tasks = (store as TaskStore).tasks;
        return Column(children: [
          Expanded(
            child: status == VxStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(tasks[index].title),
                        trailing: tasks[index].isCompleted
                            ? const Icon(Icons.done)
                            : null,
                      );
                    },
                  ),
          ),
        ]);
      },
    );
  }
}
