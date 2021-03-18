import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/InputChange.dart';
import 'package:provider_app/TaskModel.dart';

import 'Task.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isButtonActive = false;
  final taskTitleController = TextEditingController();
  final taskContentController = TextEditingController();

  String title = '';
  String content = '';

  @override
  void initState() {
    super.initState();

    taskTitleController.addListener(_handleTitleChange);
    taskContentController.addListener(_handleContentChange);
  }

  void onAdd() {
    this.title = taskTitleController.text;
    this.content = taskContentController.text;

    if (this.title.isNotEmpty && this.content.isNotEmpty) {
      final Task task = Task(
        title: this.title,
        content: this.content,
      );

      Provider.of<TaskModel>(context, listen: false).addTask(task);
      Navigator.pop(context);
    }
  }

  void _handleTitleChange() {
    Provider.of<InputChange>(context, listen: false)
        .titleChange(taskTitleController.text);
  }

  void _handleContentChange() {
    Provider.of<InputChange>(context, listen: false)
        .contentChange(taskContentController.text);
  }

  @override
  Widget build(BuildContext context) {
    print('Build page');

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(controller: taskTitleController),
                  TextField(controller: taskContentController),
                  Container(
                    child: saveButton(context),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  RaisedButton saveButton(BuildContext context) {
    bool btnState = Provider.of<InputChange>(context, listen: true).btnState;

    print('button');

    return RaisedButton(
      child: Text(btnState ? 'Save' : 'Please input'),
      onPressed: btnState ? onAdd : () => {},
    );
  }
}
