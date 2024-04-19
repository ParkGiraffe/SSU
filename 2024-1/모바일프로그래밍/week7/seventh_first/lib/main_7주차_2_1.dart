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
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
            maxLines: 2, // 7. maxLines : 정해진 줄 수만큼 출력
            overflow: TextOverflow
                .ellipsis, // 8. overflow : 영역 내에서 문자열이 넘쳤을 때, 처리(출력)하는 방식. ellipsis : 넘어가는 부분은 '...'으로 표현. clip : 그냥 잘라서 버리기(기본값). fade : 글자 밑으로 fade out 효과.
            softWrap:
                true, // 9. softWrap : 기본적으로는 단어 단위로 자르거나 사라지게 하는데, softwrap이 false이면, 단어 단위가 아니라 문자 단위로 자르게 됨. 근데 이게 false가 되면 maxLines 설정이 풀린다.
            style: TextStyle(
              // 4. TextStyle은 Text를 보조해주는 페인팅 위젯의 역할을 한다. 생긴 건 Widget 같지만, Widget을 상속받지는 않는다. 그래서 이거 하나만으로 body같은 곳에 넣을 수는 없다.
              fontSize: 50,
              fontWeight: FontWeight
                  .normal, // 5. FontWeight, Colors의 Static 속성들을 가져다가 사용.
              color: Colors.black,
              // 6. color: Color.fromARGB(alpha, red, green, blue), // 알파값 (모두 0~255)
              // color: Color.fromRGBO(red, green, blue, opacity), // opacity (RGB는 0~255, opacity는 0~1 값
              // color: Color(0xFF00FF12), //HEX코드 사용
            ),
          ),
        ),
      ),
    );
  }
}
