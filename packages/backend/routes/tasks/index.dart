import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:shared/shared.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => await _onGet(context),
    HttpMethod.post => await _onPost(context),
    _ => Response(statusCode: HttpStatus.notFound)
  };
}

Future<Response> _onGet(RequestContext context) async {
  final tasks = await context.read<TaskRepo>().fetchAllTasks();
  final json = [for (final task in tasks) task.toJson()];
  return Response.json(body: json);
}

Future<Response> _onPost(RequestContext context) async {
  final json = await context.request.json() as Map<String, dynamic>;
  final task = await context.read<TaskRepo>().addTask(Task.fromJson(json));
  return Response.json(body: task.toJson());
}
