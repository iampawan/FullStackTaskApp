import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'widgets/task_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tasks"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Expanded(
                child: TaskListView(tasks: [
                  Task(id: "1", title: "Task 1", isCompleted: false),
                  Task(id: "2", title: "Task 2", isCompleted: true),
                  Task(id: "3", title: "Task 3", isCompleted: false),
                ]),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "New Task",
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.done),
              )
            ],
          ),
        ));
  }
}
