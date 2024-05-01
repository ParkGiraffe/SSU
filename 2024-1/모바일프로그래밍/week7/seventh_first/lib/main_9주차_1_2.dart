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
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
            Container(
              width: 50,
              height: 100,
              color: Colors.green,
            ),
            Expanded(
              // 3. Expanded : 위젯의 크기를 비율로 설정할 때 사용.
              flex: 1,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
            const Spacer(flex: 2), // 5. Spacer도 유동적인 위젯이라 flex 속성을 지정할 수 있음.
            Expanded(
              flex: 2, // 4. flex : 유동적인 위젯들의 비율을 나타냄
              child: Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
