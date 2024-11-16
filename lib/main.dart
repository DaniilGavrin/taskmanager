import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/project_screen.dart';
import 'screens/task_screen.dart';

void main() {
  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Менеджер задач',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/project': (context) => ProjectScreen(),
        '/task': (context) => TaskScreen(),
      },
    );
  }
}
