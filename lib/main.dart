import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/InputChange.dart';
import 'package:provider_app/TaskModel.dart';

import 'AddTaskScreen.dart';
import 'TaskList.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => InputChange()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskModel(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AllTask(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          )
        },
        tooltip: 'Increment',
        child: Text('Add'),
      ),
    );
  }
}

class AllTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TaskModel>(
        builder: (context, task, child) => TaskList(
          task: task.allTasks,
        ),
      ),
    );
  }
}
