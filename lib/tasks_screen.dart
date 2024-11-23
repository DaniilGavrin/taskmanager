import 'package:flutter/material.dart';
import '../repositories/task_repository.dart';
import '../models/task.dart';
import 'screens/task_detail_screen.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TaskRepository _repository = TaskRepository();
  late Future<List<Task>> _tasksFuture;
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _tasksFuture = _repository.loadTasks().then((tasks) {
      _tasks = tasks;
      return tasks;
    });
  }

  Future<void> _toggleTaskCompletion(int index) async {
  setState(() {
    _tasks[index] = Task(
      title: _tasks[index].title,
      description: _tasks[index].description,
      isCompleted: !_tasks[index].isCompleted,
      createdAt: _tasks[index].createdAt, // Сохраняем дату создания
      dueDate: _tasks[index].dueDate, // Сохраняем срок выполнения, если он есть
      priority: _tasks[index].priority, // Сохраняем приоритет
      subtasks: _tasks[index].subtasks, // Сохраняем подзадачи
    );
  });

  // Сохранение изменений
  await _repository.saveTasks(_tasks);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Задачи', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'projects') {
                Navigator.pushNamed(context, '/projects');
              }
              if (value == 'tasks') {
                Navigator.pushNamed(context, '/tasks');
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'projects',
                child: Text('Проекты'),
              ),
              PopupMenuItem(
                value: 'tasks',
                child: Text('Задачи'),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<Task>>(
        future: _tasksFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка загрузки данных'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Задачи отсутствуют'));
          } else {
            return ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: IconButton(
                      icon: Icon(
                        task.isCompleted ? Icons.check_circle : Icons.circle_outlined,
                        color: task.isCompleted ? Colors.green : Colors.grey,
                      ),
                      onPressed: () {
                        _toggleTaskCompletion(index);
                      },
                    ),
                    title: Text(task.title),
                    subtitle: Text(task.description),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Переход на экран с подробной информацией
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskDetailScreen(task: task),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
