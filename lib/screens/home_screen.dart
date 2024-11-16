import 'package:flutter/material.dart';
import '../widgets/block_widget.dart';
import '../widgets/pie_chart_widget.dart';
import '../widgets/line_chart_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Text('Менеджер задач'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.pushNamed(context, '/projects');
            },
          ),
          IconButton(
            icon: Icon(Icons.task),
            onPressed: () {
              Navigator.pushNamed(context, '/tasks');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Первая линия с 4 блоками
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: BlockWidget(
                      title: 'Проекты',
                      child: Column(
                        children: [
                          PieChartWidget(totalProjects: 20), // Данные передаем сюда
                          SizedBox(height: 8),
                          Text(
                            '20 проектов',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: BlockWidget(
                      title: 'CPU',
                      child: LineChartWidget(
                        title: 'Загрузка CPU',
                        data: [20, 35, 50, 30, 40, 60, 20], // Пример данных
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: BlockWidget(
                      title: 'Memory',
                      child: LineChartWidget(
                        title: 'Использование памяти',
                        data: [1.2, 1.5, 1.8, 1.6, 1.4], // Пример данных
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: BlockWidget(
                      title: 'Заработок',
                      child: Column(
                        children: [
                          Text(
                            '25,000 ₽',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Общий доход',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Вторая линия с 3 блоками
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: BlockWidget(
                      title: 'Проекты',
                      child: ListView.builder(
                        itemCount: 5, // Количество проектов
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.green, // Цвет по статусу
                              radius: 8,
                            ),
                            title: Text('Проект ${index + 1}'),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: BlockWidget(
                      title: 'Задачи на сегодня',
                      child: ListView.builder(
                        itemCount: 4, // Количество задач
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.check_circle_outline, color: Colors.orange),
                            title: Text('Задача ${index + 1}'),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: BlockWidget(
                      title: 'Время выполнения',
                      child: LineChartWidget(
                        title: 'Часы работы',
                        data: [2, 4, 3, 5, 6, 3, 4], // Пример данных
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
