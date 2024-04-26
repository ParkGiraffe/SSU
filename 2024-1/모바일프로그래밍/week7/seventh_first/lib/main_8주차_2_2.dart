import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Hello Giraffe!',
            ),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          //  6. Column vs Row
          mainAxisAlignment: MainAxisAlignment.center, // 7. 자식 위젯들의 mainAixs 배치
          crossAxisAlignment: CrossAxisAlignment.end, // 8. 자식 위젯들의 crossAxis 배치
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
            SizedBox(
              width: 25,
            ),
            Container(
              width: 50,
              height: 100,
              color: Colors.green,
            ),
            SizedBox(
              width: 25,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
