import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/task.dart';

class TaskRepository {
  Future<List<Task>> loadTasks() async {
    final String response = await rootBundle.loadString('assets/tasks.json');
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => Task.fromJson(json)).toList();
  }
}
