import 'package:frontend/core/store/task_store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../data/remote_task_repo.dart';

class GetAllTasksMutation extends VxMutation<TaskStore> {
  GetAllTasksMutation();

  @override
  perform() async {
    final tasks = await RemoteTaskRepo().fetchAllTasks();
    store!.tasks = tasks;
  }
}
