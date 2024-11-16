import 'package:taskmanager/models/task.dart';

enum ProjectStatus { created, inProgress, onReview, completed }

class Project {
  String name;
  String description;
  ProjectStatus status;
  List<Task> tasks;

  Project({
    required this.name,
    required this.description,
    this.status = ProjectStatus.created,
    this.tasks = const [],
  });

  double get totalCost {
    return tasks.fold(0, (sum, task) => sum + task.totalCost);
  }

  Duration get totalTimeSpent {
    return tasks.fold(Duration(), (sum, task) => sum + task.timeSpent);
  }
}
