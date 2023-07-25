import 'package:backend/data/in_memory_task_repo.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:shared/shared.dart';

InMemoryTaskRepo? _taskRepo;

Handler middleware(Handler handler) {
  return handler.use(
    provider<TaskRepo>((_) {
      _taskRepo ??= InMemoryTaskRepo();
      return _taskRepo!;
    }),
  );
}
