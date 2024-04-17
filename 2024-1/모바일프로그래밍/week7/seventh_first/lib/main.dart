import 'package:flutter/material.dart';

void main() {
  // main() : 앱 프로그램 자체를 실행해주는 역할
  runApp(
      MyApp()); // runApp() : 위젯을 받아서 앱 화면에 실행시켜주는 역할. 그래서 위젯 클래스의 인스턴스를 인수로 받는다.
}

class MyApp extends StatelessWidget {
  // 위젯 클래스를 상속받도록 (StatelessWidget, StatefullWidget) 지정해줄 때, 이 클래스도 위젯이 된다.
  // StatelessWidget은 Widget 클래스를 상속받는다.

  // 위젯은 build 메소드를 무조건 선언해야 한다.
  // build()의 return 타입도 Widget이다.
  // 일반적으로 가장 상위 위젯의 build는 MaterialApp(머터리얼 안드로이드 디자인 가이드) 또는 CupertinoApp(쿠퍼티노 ios 디자인 가이드) 위젯을 return한다. <- 위젯의 시작을 알리는 큰 틀.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text(
            'hello world!'), // 3. body : scaffold 안의 테마가 적용된 상태로 위젯이 출력됨. (폰트, 색상 등등)
        appBar: AppBar(
          title: Center(
            // 5. Center는 위젯을 가운데 정렬해주는데, Widget child 속성을 통해, 가운데 정렬해줄 위젯을 받아온다.
            child: Text(
              'Hello Giraffe!',
              style: TextStyle(
                  fontSize: 50), // 6. Text의 style 속성은 TextStyle을 위젯으로 전달받는다.
            ),
          ),
          backgroundColor: Colors.orange, // Colors : Color 종류를 모아놓은 object
        ), // 4. preferredSizeWidget Appbar을 전달받음. 앱 상단의 앱바를 구성.
      ), // 1. Widget home : 앱의 첫 화면에 보여질 화면을 구성
      // 2. scaffold : 레이아웃은 아니지만, 레이아웃을 구성하는 데에 보조적인 역할을 (디자인 틀, 테마 제공) 하는 요소. 정말 건설현장에서의 비계역할.
    );
  }
}
// 마치 JS의 콜백지옥처럼, 플러터의 위젯지옥... 이게 좀 단점이라고 볼 수 있다.