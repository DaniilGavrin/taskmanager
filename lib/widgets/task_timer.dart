import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTimer extends StatelessWidget {
  final Task task;

  TaskTimer({required this.task});

  @override
  Widget build(BuildContext context) {
    // Таймер будет добавлен позже.
    return Text('Таймер для задачи: ${task.title}');
  }
}
