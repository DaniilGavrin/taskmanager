import 'dart:convert';

class Task {
  final String id;
  final String projectId;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdDate;
  final DateTime? dueDate;

  Task({
    required this.id,
    required this.projectId,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdDate,
    this.dueDate,
  });

  // Преобразование объекта в JSON
  String toJson() {
    return json.encode(toMap());
  }

  // Создание объекта из JSON
  factory Task.fromJson(String source) {
    return Task.fromMap(json.decode(source));
  }

  // Преобразование в Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectId': projectId,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'createdDate': createdDate.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
    };
  }

  // Создание объекта из Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      projectId: map['projectId'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'] ?? false,
      createdDate: DateTime.parse(map['createdDate']),
      dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate']) : null,
    );
  }
}
