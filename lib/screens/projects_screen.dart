import 'package:flutter/material.dart';
import 'package:taskmanager/screens/tasks_screen.dart';
import '../models/project.dart';
import '../utils/storage.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  List<Project> projects = [];

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  // Загрузка проектов
  void _loadProjects() async {
    final loadedProjects = await Storage.loadProjects();
    print('Загружено проектов: ${loadedProjects.length}');
    setState(() {
      projects = loadedProjects;
    });
  }

  // Добавление нового проекта
  void _addProject() {
    final newProject = Project(name: 'Новый проект', tasks: []);
    setState(() {
      projects.add(newProject);
    });
    Storage.saveProjects(projects);
    print('Добавлен новый проект: ${newProject.name}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Проекты',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: projects.isEmpty
            ? Center(
                child: Text(
                  'Нет проектов, добавьте новый!',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.separated(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print('Переход на экран задач для проекта: ${projects[index].name}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TasksScreen(project: projects[index]),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(
                          projects[index].name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: Icon(
                          Icons.work,
                          color: Colors.blueAccent,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    height: 1,
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProject,
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Добавить проект',
      ),
    );
  }
}
