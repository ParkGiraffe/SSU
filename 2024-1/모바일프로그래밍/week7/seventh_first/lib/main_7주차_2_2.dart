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
        body: const Center(
          child: Text.rich(
            // 10. 문자열 일부만 꾸미기. Text.rich() 생성자 사용.
            TextSpan(
                // 11. TextSpan 클래스를 사용해서, 문자열 일부에만 특정 스타일 적용.
                style: TextStyle(
                  // 12. 부모 TextSpan에서 TextStyle을 적용하면, 자식 전체에 스타일 적용됨.
                  fontSize: 30,
                ),
                children: [
                  // Widget[] 배열 형태. 여러 개의 위젯을 전달받음.
                  TextSpan(text: 'Lorem Ipsum is '),
                  TextSpan(
                    text: 'simply ',
                    style: TextStyle(
                      // 13. 특정 자식에게만 style을 지정하면, 부모의 style은 그대로 받은 채 자식의 style이 겹쳐서 적용됨.
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  TextSpan(text: 'dummy text '),
                ]),
          ),
        ),
      ),
    );
  }
}
