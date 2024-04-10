import 'human.dart';

void main() {}

class Student extends Human {
  String major;
  String className;
  String grade;

  Student({
    required super.name,
    required super.age,
    required this.major,
    required this.className,
    required this.grade,
  });

  @override
  void sayHello() {
    print('숭실대학교 학생입니다. 전공은 $major이고 학점은 $grade입니다.');
  }
}
