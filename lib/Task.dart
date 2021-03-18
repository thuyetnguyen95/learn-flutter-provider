import 'package:flutter/material.dart';

class Task {
  String title;
  String content;

  Task({
    @required this.title,
    @required this.content,
  });

  void saveTask(title, content) {
    this.title = title;
    this.content = content;
  }
}
