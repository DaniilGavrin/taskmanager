import 'package:shared_preferences/shared_preferences.dart';
import '../models/project_model.dart';
import '../models/task_model.dart';

class DataProvider {
  static const _projectsKey = 'projects';
  static const _tasksKey = 'tasks';

  // Сохранение проектов
  Future<void> saveProjects(List<Project> projects) async {
    final prefs = await SharedPreferences.getInstance();
    final projectsJson = projects.map((p) => p.toJson()).toList();
    await prefs.setStringList(_projectsKey, projectsJson);
  }

  // Загрузка проектов
  Future<List<Project>> loadProjects() async {
    final prefs = await SharedPreferences.getInstance();
    final projectsJson = prefs.getStringList(_projectsKey);
    if (projectsJson == null) return [];
    return projectsJson.map((p) => Project.fromJson(p)).toList();
  }

  // Сохранение задач
  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = tasks.map((t) => t.toJson()).toList();
    await prefs.setStringList(_tasksKey, tasksJson);
  }

  // Загрузка задач
  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getStringList(_tasksKey);
    if (tasksJson == null) return [];
    return tasksJson.map((t) => Task.fromJson(t)).toList();
  }
}
