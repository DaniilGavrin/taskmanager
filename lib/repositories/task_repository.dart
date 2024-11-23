import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class TaskRepository {
  // Метод для загрузки задач
  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedData = prefs.getString('tasks');

    if (storedData != null) {
      // Загружаем данные из SharedPreferences
      try {
        final List<dynamic> data = jsonDecode(storedData);
        return data.map((json) => Task.fromJson(json)).toList();
      } catch (e) {
        print('Ошибка загрузки данных из SharedPreferences: $e');
      }
    }

    // Если данных в SharedPreferences нет или ошибка, загружаем из assets
    try {
      final String response = await rootBundle.loadString('assets/tasks.json');
      final List<dynamic> data = jsonDecode(response);
      return data.map((json) => Task.fromJson(json)).toList();
    } catch (e) {
      print('Ошибка загрузки данных из assets: $e');
      return [];
    }
  }

  // Метод для сохранения задач
  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final String jsonData = jsonEncode(tasks.map((task) => task.toJson()).toList());
      await prefs.setString('tasks', jsonData);
    } catch (e) {
      print('Ошибка сохранения данных: $e');
    }
  }
}
