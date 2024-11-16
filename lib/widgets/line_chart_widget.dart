import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  final String title;
  final List<double> data;

  const LineChartWidget({required this.title, required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200, // Высота графика
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: false,
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
              ),
              borderData: FlBorderData(
                border: const Border(
                  left: BorderSide(color: Colors.black12, width: 1),
                  bottom: BorderSide(color: Colors.black12, width: 1),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: _generateSpots(),
                  isCurved: true,
                  color: Colors.blue, // Обновлено с параметром color
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.blue.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<FlSpot> _generateSpots() {
    return List.generate(data.length, (index) => FlSpot(index.toDouble(), data[index]));
  }
}
