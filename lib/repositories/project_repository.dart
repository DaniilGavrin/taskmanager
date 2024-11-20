import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/project.dart';

class ProjectRepository {
  Future<List<Project>> loadProjects() async {
    final String response = await rootBundle.loadString('projects.json');
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => Project.fromJson(json)).toList();
  }
}
