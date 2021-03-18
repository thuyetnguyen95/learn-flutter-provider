import 'package:flutter/material.dart';
import 'package:provider_app/Task.dart';
import 'dart:collection';

class TaskModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_tasks);

  void addTask(Task task) {
    _tasks.add(task);

    notifyListeners();
  }
}
