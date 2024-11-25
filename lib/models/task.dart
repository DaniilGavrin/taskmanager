class Task {
  final String title;
  final String description;

  Task({required this.title, required this.description});

  // Преобразование объекта Task в Map (для JSON)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  // Создание объекта Task из Map (для JSON)
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      description: map['description'],
    );
  }
}
