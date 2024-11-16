import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Задачи', context: context),
      body: Center(
        child: Text(
          'Список задач появится здесь',
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
