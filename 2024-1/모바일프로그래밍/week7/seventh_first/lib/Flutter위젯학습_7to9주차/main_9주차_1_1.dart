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
        body: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
            const Spacer(), // 1. Spacer : 빈 공간을 차지하는 위젯. 너비나 높이를 가지는 위젯들 사이에서 나머지 영역을 모두 빈공간으로 처리해버린다.
            Container(
              width: 50,
              height: 100,
              color: Colors.green,
            ),
            const Spacer(), // 2. Spacer가 여러 개이면, 남은 공간을 서로 나눠서 가져간다.
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
