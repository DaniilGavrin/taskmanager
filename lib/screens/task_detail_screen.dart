import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  const TaskDetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.blueAccent.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // AppBar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Детали задачи',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 8.0,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Заголовок задачи
                            Text(
                              task.title,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 16.0),

                            // Описание задачи
                            Text(
                              task.description,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 16.0),

                            // Статус задачи
                            Row(
                              children: [
                                Text(
                                  'Статус: ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                Chip(
                                  label: Text(
                                    task.isCompleted ? 'Выполнена' : 'Не выполнена',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: task.isCompleted ? Colors.green : Colors.red,
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),

                            // Приоритет
                            Row(
                              children: [
                                Text(
                                  'Приоритет: ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                Chip(
                                  label: Text(
                                    task.priority,
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                  backgroundColor: task.priority == 'Высокий'
                                      ? Colors.red
                                      : task.priority == 'Средний'
                                          ? Colors.orange
                                          : Colors.green,
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),

                            // Даты
                            if (task.dueDate != null)
                              Text(
                                'Крайний срок: ${task.dueDate}',
                                style: TextStyle(fontSize: 18, color: Colors.black87),
                              ),
                            SizedBox(height: 16.0),

                            // Подзадачи
                            if (task.subtasks.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Подзадачи:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  ...task.subtasks.map((subtask) => ListTile(
                                        leading: Icon(Icons.circle_outlined, color: Colors.grey),
                                        title: Text(subtask),
                                      )),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
