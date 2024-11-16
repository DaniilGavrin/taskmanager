import 'package:taskmanager/models/project.dart';

extension ProjectStatusExtension on ProjectStatus {
  String get name {
    switch (this) {
      case ProjectStatus.created:
        return "Создано";
      case ProjectStatus.inProgress:
        return "В работе";
      case ProjectStatus.onReview:
        return "На проверке";
      case ProjectStatus.completed:
        return "Завершен";
    }
  }
}
