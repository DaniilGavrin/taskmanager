import 'package:flutter/material.dart';
import '../models/task_model.dart'; // Импорт модели

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  const TaskDetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Описание: ${task.description}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Дата создания: ${task.createdDate.toLocal()}',
              style: const TextStyle(fontSize: 16),
            ),
            if (task.dueDate != null)
              Text(
                'Срок выполнения: ${task.dueDate!.toLocal()}',
                style: const TextStyle(fontSize: 16),
              ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Статус:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 10),
                Text(
                  task.isCompleted ? 'Выполнено' : 'Не выполнено',
                  style: TextStyle(
                    fontSize: 16,
                    color: task.isCompleted ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
