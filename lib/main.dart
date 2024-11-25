import 'package:flutter/material.dart';
import 'screens/projects_screen.dart';
import 'screens/tasks_screen.dart';
import 'models/project.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Add `const` to the constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskAPP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme( // Use `const` for better performance
          bodyLarge: TextStyle(fontFamily: 'Arial', fontSize: 18), // Updated text style name
          headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 24), // Updated headline style name
        ),
      ),
      home: const HomeScreen(), // Add `const` here as well
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // Add `const` to the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background with gradient
      body: Container(
        decoration: const BoxDecoration( // Use `const` here
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.cyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title with larger text style
              const Text(
                'Добро пожаловать в TaskAPP!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              // Buttons with icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildMenuButton(
                    context,
                    'Проекты',
                    Icons.work,
                    ProjectsScreen(),
                  ),
                  const SizedBox(width: 20),
                  _buildMenuButton(
                    context,
                    'Задачи',
                    Icons.task,
                    TasksScreen(
                      project: Project(name: 'Новый проект', tasks: []),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build menu button with icon and label
  Widget _buildMenuButton(
      BuildContext context, String label, IconData icon, Widget screen) {
    return ElevatedButton.icon(
      onPressed: () {
        print('Открытие экрана: $label');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      icon: Icon(icon, size: 30),
      label: Text(label, style: const TextStyle(fontSize: 18)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Use `backgroundColor` instead of `primary`
        foregroundColor: Colors.blueAccent, // Use `foregroundColor` instead of `onPrimary`
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
    );
  }
}
