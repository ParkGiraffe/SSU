import 'package:flutter/material.dart';

// 사전 설정
/*
1. vscode 설정 - save on format : 저장할때마다 자동으로 포맷최적화
*/

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
            // 2. 앞으로 변하지 않을 위젯에는 const 키워드를 붙임으로써, 재렌더링/재설정되는 것을 방지함으로써 앱의 퍼포먼스를 높일 수 있다.
            // 3. 부모가 const이면, 하위 위젯들은 전부 const가 적용된다. 근데, 자식 중에 const를 못 붙이는 상황이 생기면, 부모에 const만 붙여서는 해결이 안 된다. -> 나중에 설명 예정.
            child: Text(
              'Hello Giraffe!',
            ),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          // 14. Container : 위젯을 담는 위젯. JS의 DIV와 비슷해보이는 위젯. 하위 위젯의 너비와 높이를 지정하거나, 배경이나 테두리를 추가할 때 주로 사용.
          width: 100,
          height: 100,

          // 17. margin, padding은 EdgeInsets를 사용.
          margin: EdgeInsets.all(10), // margin: 바깥 여백
          padding: EdgeInsets.all(10), // padding: 안쪽 여백

          // color: Colors.red,
          decoration: BoxDecoration(
            // 15. BoxDecoration 페인팅 위젯을 통해 Conainer 박스의 디자인을 설정할 수 있다.
            color: Colors
                .red, // 16. BoxDecoraion의 컬러가 지정되면, Container 자체의 Color는 지워야 한다.
            border: Border.all(
              width: 5,
              color: Colors.blue,
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(10),
            ),
          ),
          child: Container(
            // 18. 자식 컨테이너의 크기를 설정하지 않을 경우, 부모 위젯의 크기를 그대로 적용.
            color: Colors.yellow,

            // 19. 부모 컨테이너의 크기를 설정하지 않고, 자식 컨테이너의 크기만 설정한 경우, 자식 위젯의 크기를 그대로 적용.
            // 20. 둘 다의 크기를 설정한 경우, 자식 위젯의 크기는 무시되고, 부모 위젯의 크기를 적용한다.
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
