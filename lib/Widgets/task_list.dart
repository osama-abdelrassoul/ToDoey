import 'package:flutter/material.dart';
import 'package:todoey/Widgets/task_tile.dart';

import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  // final List<Task> tasks ;
  // TasksList(this.tasks);
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ((context, taskData, child) {
        return ListView.builder(
          itemBuilder: ((context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              checkboxCallback: (bool? checkBoxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deletTask(task);
              },
              taskTitle: task.name,
              isChecked: task.isDone,
            );
          }),
          itemCount: taskData.taskCount,
        );
      }),
    );
  }
}
