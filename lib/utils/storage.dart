import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import '../models/project.dart';
import '../models/task.dart';

class Storage {
  // Получаем путь для хранения данных
  static Future<String> _getLocalPath() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = Directory('${directory.path}/ByteWizard/TaskAPP');  // Папка для хранения данных приложения
    
      // Создаем папку, если она не существует
      if (!(await path.exists())) {
        await path.create(recursive: true);
      }
    
      return path.path;
    } catch (e) {
      print("Ошибка при получении пути для хранения данных: $e");
      rethrow;  // Перебрасываем ошибку, чтобы её можно было обработать выше
    }
  }

  // Получаем файл для хранения проектов
  static Future<File> _getProjectsFile() async {
    try {
      final path = await _getLocalPath();
      return File('$path/projects.json');
    } catch (e) {
      print("Ошибка при получении файла для проектов: $e");
      rethrow;
    }
  }

  // Сохранение списка проектов в файл
  static Future<void> saveProjects(List<Project> projects) async {
    try {
      final file = await _getProjectsFile();
      final projectsMap = projects.map((project) => project.toMap()).toList();
      await file.writeAsString(jsonEncode(projectsMap));
      print("Проекты успешно сохранены.");
    } catch (e) {
      print("Ошибка при сохранении проектов: $e");
    }
  }

  // Чтение списка проектов из файла
  static Future<List<Project>> loadProjects() async {
    try {
      final file = await _getProjectsFile();
      // Проверяем, существует ли файл
      if (!(await file.exists())) {
        return []; // Если файл не существует, возвращаем пустой список
      }
      final contents = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(contents);
      return jsonData.map((item) => Project.fromMap(item)).toList();
    } catch (e) {
      print("Ошибка при загрузке проектов: $e");
      return []; // Если произошла ошибка, возвращаем пустой список
    }
  }
}
