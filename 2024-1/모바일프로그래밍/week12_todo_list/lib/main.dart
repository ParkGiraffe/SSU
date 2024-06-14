import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/todo_model.dart';
import 'screens/home_screen.dart';

void main() async {
  // main 코드를 새로 작성하는 거기 때문에, 처음부터 다시 빌드를 해야 작동확인 가능
  await Hive.initFlutter();
  Hive.registerAdapter(
      TodoAdapter()); // Todo model의 클래스에 hive를 생성하면, 자동으로 클래스 이름 뒤에 Adapter를 붙여서 클래스 모델을 하이브 내부에 생성한다. - 원시타입의 데이터만 저장할 경우에는 필요하지 않은 코드.

  await Hive.openBox<Todo>('todoList');
  // <> 안에는 Adapter와 연결된 데이터 타입만 넣기.
  // ('') : Box의 이름. 여러 개의 Box를 생성할 경우, 이를 구분해주는 역할.

  // var box = Hive.box<Todo>('todoList'); // 생성한 Box 참조
  // box.add(
  //   Todo(
  //     id: DateTime.now().toString(),
  //     todoContent: '로컬 DB',
  //   ),
  // ); // add 메소드를 사용하여 todo 추가하기

  // box.put(
  //   DateTime.now().toString(),
  //   Todo(
  //     id: DateTime.now().toString(),
  //     todoContent: 'Hive 연습하기',
  //   ),
  // ); // put 메소드를 사용하여 todo 추가하기 - put(키 - 직접 지정 가능, 값)

  // box.delete(0);

  // box.toMap().forEach((key, value) {
  //   print(
  //     '[key] $key, [value] id: ${value.id} | todoContent: ${value.todoContent} | isDone: ${value.isDone}',
  //   );
  // }); // box에 저장된 데이터(key-value) 출력하기, Map 타입은 for in 구문 사용 X

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     systemNavigationBarColor: TodoColors.background,
    //   ),
    // );

    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge); // 안드로이드 내비게이션 바를 무시하고 전체를 전부 사용하겠다는 의미.

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      home: HomeScreen(),
    );
  }
}
