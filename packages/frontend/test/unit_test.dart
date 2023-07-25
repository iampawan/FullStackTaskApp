import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/data/remote_task_repo.dart';

void main() {
  test('Counter increments smoke test', () async {
    final response = await RemoteTaskRepo().fetchAllTasks();
    expect(response.length, 3);
  });
}
