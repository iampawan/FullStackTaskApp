import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:shared/shared.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  return switch (context.request.method) {
    HttpMethod.get => await _onGet(context, id),
    HttpMethod.put => await _onPut(context, id),
    HttpMethod.delete => await _onDelete(context, id),
    _ => Response(statusCode: HttpStatus.notFound)
  };
}

Future<Response> _onGet(RequestContext context, String id) async {
  final task = await context.read<TaskRepo>().getTaskById(id);
  return Response.json(body: task.toJson());
}

Future<Response> _onPut(RequestContext context, String id) async {
  final json = await context.request.json() as Map<String, dynamic>;
  final task = Task.fromJson(json).copyWith(id: id);
  await context.read<TaskRepo>().updateTask(task);
  return Response();
}

Future<Response> _onDelete(RequestContext context, String id) async {
  await context.read<TaskRepo>().deleteTask(id);
  return Response();
}
