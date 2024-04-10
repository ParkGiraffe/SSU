// dart는 '_'를 이용해서 private 적용.
// 근데 대부분 private는 클래스 단위로 적용되는 게 일반적인데, dart는 패키지(라이브러리, 파일)기준으로 적용..

import '../lib/human.dart';

void main() {
  var human = Human(name: 'name', age: 1);
  // human._age = 10;  <- 적용이 안 된다. private 적용됨.
}

// extends 키워드로 상속.
class Student extends Human {
  late String major;
  late String className;
  late String grade;

  Student({
    required super.name,
    required super.age,
    required this.major,
    required this.className,
    required this.grade,
  });
}

class Instructor extends Human {
  late int department;
  late String className;

  Instructor({
    required super.name,
    required super.age,
    required this.department,
    required this.className,
  });

  @override
  void sayHello() {
    print('안녕하세요. 제 이름은 $name입니다. 강의실는 $department입니다.');
  }
}
