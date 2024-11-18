import 'package:flutter/material.dart';
import '/screens/home_screen.dart';
import '/screens/project_screen.dart';
import '/screens/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/projects': (context) => ProjectScreen(),
        '/tasks': (context) => TaskScreen(),
      },
    );
  }
}
