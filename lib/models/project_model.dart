import 'dart:convert';

class Project {
  final String id;
  final String name;
  final String description;
  final DateTime createdDate;
  final DateTime? deadline;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.createdDate,
    this.deadline,
  });

  // Преобразование объекта в JSON
  String toJson() {
    return json.encode(toMap());
  }

  // Создание объекта из JSON
  factory Project.fromJson(String source) {
    return Project.fromMap(json.decode(source));
  }

  // Преобразование в Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdDate': createdDate.toIso8601String(),
      'deadline': deadline?.toIso8601String(),
    };
  }

  // Создание объекта из Map
  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      createdDate: DateTime.parse(map['createdDate']),
      deadline: map['deadline'] != null ? DateTime.parse(map['deadline']) : null,
    );
  }
}
