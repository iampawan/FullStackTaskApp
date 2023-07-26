import 'package:flutter/material.dart';
import 'package:frontend/core/mutations/delete_task.dart';
import 'package:frontend/core/mutations/get_all_tasks.dart';
import 'package:frontend/core/mutations/update_task.dart';
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
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return ListTile(
                        title: Text(task.title)
                            .text
                            .white
                            .xl
                            .semiBold
                            .make()
                            .box
                            .p32
                            .rounded
                            .color(context.theme.primaryColor)
                            .make(),
                        subtitle: task.isCompleted
                            ? const Text("Completed").px8()
                            : const Text("Not Completed").px8(),
                        trailing: ButtonBar(
                          children: [
                            IconButton(
                                onPressed: () {
                                  UpdateTaskMutation(task.copyWith(
                                      isCompleted: !task.isCompleted));
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () {
                                  DeleteTaskMutation(task.id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ).w(context.percentWidth * 10),
                      );
                    },
                  ),
          ),
        ]);
      },
    );
  }
}
