import 'package:flutter/material.dart';
import 'drawer_screen.dart';

class PastScreen extends StatelessWidget {
  const PastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        title: Text("지난 할 일"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("이전 페이지"),
            ),
          ],
        ),
      ),
    );
  }
}
