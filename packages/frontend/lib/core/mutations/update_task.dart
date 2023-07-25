import 'package:frontend/core/data/remote_task_repo.dart';
import 'package:frontend/core/store/task_store.dart';
import 'package:shared/shared.dart';
import 'package:velocity_x/velocity_x.dart';

import 'get_all_tasks.dart';

class UpdateTaskMutation extends VxMutation<TaskStore> {
  final Task task;

  UpdateTaskMutation(this.task);

  @override
  perform() async {
    await RemoteTaskRepo().updateTask(task);
    GetAllTasksMutation();
  }
}
