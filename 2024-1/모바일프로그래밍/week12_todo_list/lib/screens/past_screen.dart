import 'package:flutter/material.dart';
import 'package:week12_todo_list/constants/todo_colors.dart';
import 'package:week12_todo_list/screens/drawer_screen.dart';

class PastScreen extends StatelessWidget {
  const PastScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('지난 할 일'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('이전 페이지'),
            ),
          ],
        ),
      ),
    );
  }
}
