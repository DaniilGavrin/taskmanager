import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../services/data_provider.dart';
import 'project_detail_screen.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final DataProvider _dataProvider = DataProvider();
  List<Project> _projects = [];

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    final projects = await _dataProvider.loadProjects();
    setState(() {
      _projects = projects;
    });
  }

  Future<void> _addProject() async {
    String? name;
    String? description;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить проект'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Название проекта'),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Описание проекта'),
                onChanged: (value) => description = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                if (name != null && name!.isNotEmpty) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Добавить'),
            ),
          ],
        );
      },
    );

    if (name != null && name!.isNotEmpty) {
      final newProject = Project(
        id: DateTime.now().toString(),
        name: name!,
        description: description ?? '',
        createdDate: DateTime.now(),
      );
      setState(() {
        _projects.add(newProject);
      });
      await _dataProvider.saveProjects(_projects);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список проектов'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addProject,
          ),
        ],
      ),
      body: _projects.isEmpty
          ? const Center(child: Text('Нет проектов'))
          : ListView.builder(
              itemCount: _projects.length,
              itemBuilder: (context, index) {
                final project = _projects[index];
                return ListTile(
                  title: Text(project.name),
                  subtitle: Text(project.description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectDetailScreen(project: project),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
