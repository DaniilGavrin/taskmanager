import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final BuildContext context;

  CustomAppBar({required this.title, required this.context});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.blueAccent,
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Проекты') {
              Navigator.pushNamed(context, '/project');
            } else if (value == 'Задачи') {
              Navigator.pushNamed(context, '/task');
            }
          },
          color: Colors.white,
          icon: Icon(Icons.menu, color: Colors.white),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: 'Проекты',
              child: Row(
                children: [
                  Icon(Icons.folder, color: Colors.blueAccent),
                  SizedBox(width: 8),
                  Text('Проекты'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'Задачи',
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Text('Задачи'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
