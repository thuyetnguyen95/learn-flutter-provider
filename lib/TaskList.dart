import 'package:flutter/material.dart';
import 'package:provider_app/TaskListItem.dart';

import 'Task.dart';

class TaskList extends StatelessWidget {
  final List<Task> task;

  TaskList({@required this.task});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTask(),
    );
  }

  List<Widget> getChildrenTask() {
    return task.map((task) => TaskListItem(task: task)).toList();
  }
}
