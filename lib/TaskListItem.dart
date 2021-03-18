import 'package:flutter/material.dart';

import 'Task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  TaskListItem({@required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.content),
    );
  }
}
