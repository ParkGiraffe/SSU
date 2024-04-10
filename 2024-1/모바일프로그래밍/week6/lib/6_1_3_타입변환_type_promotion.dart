import 'human.dart';

void main() {
  var student = Student(
      name: 'name',
      age: 20,
      major: 'major',
      grade: 'grade',
      foodName: 'foodName',
      className: 'className');

  // is 키워드 (타입 비교)
  print(student is Student);
  print(student is Human); // 상속해준 부모 클래스와도 동치.
}

// 부모 상속 먼저하고 인터페이스 연결
class Student extends Human implements IEaterable, ILeanerable {
  // 여러 개 인터페이스 적용 가능
  String major;
  String grade;

  // 인터페이스는 상속이 아니라, 말 그대로 내 거이기 때문에, 이렇게 적어준다. 인터페이스의 속성은 override 명시
  @override
  String foodName;
  @override
  String className;

  Student({
    // 부모 클래스
    required super.name,
    required super.age,
    // 고유
    required this.major,
    required this.grade,
    // 인터페이스
    required this.foodName,
    required this.className,
  });

  @override
  void sayHello() {
    print('숭실대학교 학생입니다. 전공은 $major이고 학점은 $grade입니다.');
  }

  // 인터페이스에서도 override
  @override
  void eat({required String foodName}) {
    print('학생식당에서 $foodName을 먹습니다.');
  }

  @override
  void learn({required String className}) {
    print('$className을 듣습니다.');
  }
}

// 암묵적으로 interface 클래스의 이름 앞에 대문자 I를 붙인다.
// 인터페이스는 일반적인 클래스와는 다르게 부모 자식 상속관계로 표현하지 않는다. 상속이라는 용어 대신 구현이라는 용어를 쓴다. 부모 자시의 관계성 없이 인터페이스의 구조만 가져다가 사용한다. 일반적으로 '기능'을 나타낸다.
// 부모 자식의 관계 없이, 공통적으로 다양한 클래스에게 특정 기능이 필요하다고 볼때, 그 기능들을 한 데 모아 인터페이스를 만들고 연결한다.
// 상속은 부모가 하나 뿐이지만, 인터페이스는 중복으로 연결할 수 있다. 기능들을 입맛대로 가져다가 전부 사용할 수 있다.
class IEaterable {
  String foodName;

  IEaterable({required this.foodName});

  // abstract는 아니기 때문에, 함수를 완성해줄 필요가 있다.
  void eat({required String foodName}) {}
}

class ILeanerable {
  String className;

  ILeanerable({required this.className});

  void learn({required String className}) {}
}
