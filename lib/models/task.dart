enum TaskType { hourly, fixed }

class Task {
  String title;
  String description;
  TaskType type;
  double costPerHour; // Почасовая ставка
  double fixedCost; // Фиксированная стоимость
  Duration timeSpent; // Время выполнения
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.type,
    this.costPerHour = 0.0,
    this.fixedCost = 0.0,
    this.timeSpent = const Duration(),
    this.isCompleted = false,
  });

  double get totalCost {
    return type == TaskType.hourly
        ? costPerHour * timeSpent.inHours
        : fixedCost;
  }
}
