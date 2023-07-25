import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared/shared.dart';

class RemoteTaskRepo implements TaskRepo {
  final client = http.Client();
  final baseUrl = 'http://localhost:8080';

  @override
  Future<List<Task>> fetchAllTasks() async {
    final response = await client.get(Uri.parse("$baseUrl/tasks"));
    final json = response.body;
    return [for (final task in jsonDecode(json)) Task.fromJson(task)];
  }

  @override
  Future<Task> getTaskById(String id) async {
    return Task(id: "id", title: "title");
  }

  @override
  Future<Task> addTask(Task task) async {
    return Task(id: "id", title: "title");
  }

  @override
  Future<void> deleteTask(String id) async {}

  @override
  Future<void> updateTask(Task task) async {}
}
