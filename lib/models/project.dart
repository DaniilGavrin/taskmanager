class Project {
  final String title;
  final String description;

  Project({
    required this.title,
    required this.description,
  });

  // Десериализация из JSON
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'],
      description: json['description'],
    );
  }

  // Сериализация в JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}
