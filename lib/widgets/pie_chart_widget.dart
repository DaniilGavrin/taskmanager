import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartWidget extends StatelessWidget {
  final int totalProjects;

  const PieChartWidget({required this.totalProjects, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: _getSections(),
        centerSpaceRadius: 40,
        sectionsSpace: 2,
        centerSpaceColor: Colors.white,
        borderData: FlBorderData(show: false),
      ),
    );
  }

  List<PieChartSectionData> _getSections() {
    const completed = 5; // Завершено
    const inProgress = 10; // В работе
    const pending = 5; // На проверке

    return [
      PieChartSectionData(
        value: completed.toDouble(),
        color: Colors.green,
        title: '$completed',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        value: inProgress.toDouble(),
        color: Colors.blue,
        title: '$inProgress',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        value: pending.toDouble(),
        color: Colors.orange,
        title: '$pending',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }
}
