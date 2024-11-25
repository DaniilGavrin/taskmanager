import 'package:flutter/material.dart';
import '../models/project.dart';
import '../models/task.dart';

class TasksScreen extends StatefulWidget {
  final Project project;

  TasksScreen({required this.project});

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    tasks = widget.project.tasks; // Теперь tasks это список объектов Task
    print('Загружены задачи для проекта: ${widget.project.name}');
    print('Количество задач: ${tasks.length}');
  }

  // Добавление новой задачи
  void _addTask() {
    final newTask = Task(title: 'Новая задача', description: 'Описание задачи');
    setState(() {
      tasks.add(newTask);
    });
    print('Добавлена новая задача: ${newTask.title}');
    // Здесь вы можете сохранить изменения в проекте (например, обновить файл JSON)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.name),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: tasks.isEmpty
            ? Center(
                child: Text(
                  'Нет задач для этого проекта. Добавьте новую задачу!',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.separated(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print('Выбрана задача: ${tasks[index].title}');
                    },
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(
                          tasks[index].title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          tasks[index].description,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        leading: Icon(
                          Icons.task,
                          color: Colors.blueAccent,
                          size: 30,
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    height: 1,
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Добавить задачу',
      ),
    );
  }
}
