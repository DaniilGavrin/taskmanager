class Task {
  final String title;
  final String description;
  final bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  // Десериализация из JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }

  // Сериализация в JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
