import 'package:frontend/core/data/remote_task_repo.dart';
import 'package:frontend/core/store/task_store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'get_all_tasks.dart';

class DeleteTaskMutation extends VxMutation<TaskStore> {
  final String id;

  DeleteTaskMutation(this.id);

  @override
  perform() async {
    await RemoteTaskRepo().deleteTask(id);
    GetAllTasksMutation();
  }
}
