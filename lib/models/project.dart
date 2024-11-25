import 'package:taskmanager/models/task.dart';

class Project {
  String name;
  List<Task> tasks;  // Заменил String на Task, так как задачи - это объекты Task

  Project({required this.name, required this.tasks});

  // Метод для преобразования объекта в Map (для JSON)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'tasks': tasks.map((task) => task.toMap()).toList(),  // Сериализация списка задач
    };
  }

  // Метод для восстановления объекта из Map (для JSON)
  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'],
      tasks: (map['tasks'] as List).map((taskMap) => Task.fromMap(taskMap)).toList(),  // Десериализация задач
    );
  }
}
