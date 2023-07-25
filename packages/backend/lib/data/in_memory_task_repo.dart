import 'package:shared/shared.dart';

/// A class that implements [TaskRepo] using an in-memory list.
class InMemoryTaskRepo implements TaskRepo {
  List<Task> _data = [
    // Task(
    //   id: '1',
    //   title: 'Buy iPhone',
    // ),
    // Task(
    //   id: '2',
    //   title: 'Throw iPhone',
    // ),
    // Task(
    //   id: '3',
    //   title: 'Buy another iPhone',
    // ),
  ];

  /// Returns the list of tasks.
  List<Task> get tasks => _data;

  @override
  Future<Task> addTask(Task task) async {
    final newTask = task;
    _data.add(newTask);
    return newTask;
  }

  @override
  Future<void> deleteTask(String id) async {
    _data = [
      for (final task in _data)
        if (task.id != id) task
    ];
  }

  @override
  Future<List<Task>> fetchAllTasks() async {
    return _data;
  }

  @override
  Future<Task> getTaskById(String id) async {
    return _data.firstWhere((task) => task.id == id);
  }

  @override
  Future<void> updateTask(Task task) async {
    _data = [
      for (final t in _data)
        if (t.id == task.id) task else t
    ];
  }
}
