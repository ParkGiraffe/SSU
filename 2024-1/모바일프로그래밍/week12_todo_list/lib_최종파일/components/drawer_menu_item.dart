import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../constants/todo_colors.dart';
import '../screens/home_screen.dart';
import '../models/todo_model.dart';
import '../util/utils.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('Move to "$title" Screen');
        // Navigator.pop(context);
        if (Scaffold.of(context).isDrawerOpen) {
          Scaffold.of(context).closeDrawer();
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              title: title,
            ),
          ),
        );
      },
      leading: Icon(
        icon,
        color: TodoColors.point,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: TodoColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        createTodoList(
          title: title,
          list: Hive.box<Todo>("todoList").values,
        ).length.toString(),
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
