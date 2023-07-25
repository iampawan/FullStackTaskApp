import 'package:flutter/material.dart';

import 'core/mutations/get_all_tasks.dart';
import 'widgets/add_task_widget.dart';
import 'widgets/task_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        actions: [
          IconButton(
            onPressed: () => GetAllTasksMutation(),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TaskListView(),
        ),
      ),
      bottomNavigationBar: const AddTaskWidget(),
    );
  }
}
