import 'package:hive/hive.dart';

part 'todo_model.g.dart';
// part : 실제로 파일은 두 개이지만, 시스템 내부는 하나의 통합된 파일로 간주하게 한다. 근데, todo_model.g.dart는 사용자가 직접 수정해서는 안 되는 파일이기 때문에, 안전성을 위해 part를 이용해서 개발 중에는 따로 관리하도록 한다.

// dart run build_runner build : 터미널에 dart로 build_runner의 build(코드 생성)를 실행하라는 명령어 입력
// 그러면 'todo_model.g.dart';의 빨간 불이 꺼짐. 실제로 모델 생성됨.

// typeId : 여러 모델 클래스를 구분하기 위해 고유한 숫자를 집어넣는다. 무조건 Int 타입만
@HiveType(typeId: 0)
class Todo {
  // property들도 구분하기 위해 고유한 Int 인덱스값을 부여한다.
  @HiveField(0)
  String id;

  @HiveField(1)
  String todoContent;

  @HiveField(2)
  bool isDone;

  Todo({
    required this.id,
    required this.todoContent,
    this.isDone = false,
  });

  static List<Todo> createDummyTodoList() {
    return [
      Todo(id: '01', todoContent: 'Dart 공부하기', isDone: true),
      Todo(id: '02', todoContent: 'Flutter Framework 이해하기', isDone: true),
      Todo(id: '03', todoContent: 'StatefulWidget 공부하기'),
      Todo(id: '04', todoContent: '거래처 연락하기'),
      Todo(id: '05', todoContent: '메일 확인하기'),
      Todo(id: '06', todoContent: '마트 장보기'),
      Todo(id: '07', todoContent: '은행 업무보기'),
      Todo(id: '08', todoContent: '운동하기'),
      Todo(id: '09', todoContent: '숙소 예약하기'),
      Todo(id: '10', todoContent: '식당 예약하기'),
    ];
  }
}
