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
          body: SingleChildScrollView(
            // 6. SingleChildScrollView : 스크롤이 가능한 위젯이 된다.
            scrollDirection: Axis
                .horizontal, // 7. ScrollDirection : 스크롤 방향을 설정해준다. horizontal - 수평, vertical - 수직
            child: Row(
              children: [
                Container(
                  width: 200,
                  height: 300,
                  color: Colors.red,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  width: 200,
                  height: 50,
                  color: Colors.blue,
                ),
              ],
            ),
          )),
    );
  }
}
