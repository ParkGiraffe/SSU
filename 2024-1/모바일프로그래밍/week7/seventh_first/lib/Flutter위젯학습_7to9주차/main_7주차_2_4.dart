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
          body: SizedBox(
            // 21. SizedBox : 영역을 구분하고 다른 위젯을 담는데 사용. Container와 다르게 margin, padding, decoration 설정은 불가.
            width: 200,
            height: 200,
            child: Padding(
              // 22. padding 속성이 없는 padding 스타일이 필요할 경우, Padding() 위젯을 사용한다.
              padding: const EdgeInsets.all(10),
              child: Container(color: Colors.red),
            ),
          )),
    );
  }
}
