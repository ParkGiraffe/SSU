import 'package:flutter/material.dart';
import '../constants/todo_colors.dart';

class DrawerMenuButton extends StatelessWidget {
  const DrawerMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        print("Open Drawer Menu");
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(
        Icons.menu,
        color: TodoColors.black,
        size: 30,
      ),
    );
  }
}
