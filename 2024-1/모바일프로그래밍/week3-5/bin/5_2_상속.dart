void main() {}

class Human {
  late String name;
  late int age;

  Human({required this.name, required this.age});

  void sayHello() => print('안녕하세요. 제 이름은 $name입니다. 나이는 $age입니다.');
}

// extends 키워드로 상속.
class Student extends Human {
  late String major;
  late String className;
  late String grade;

  // 상속 받을 때 super 사용

  // 1번
  // Student({
  //   required String name,
  //   required int age,
  //   required String major,
  //   required String className,
  //   required String grade,
  // }) : super(name: name, age: age) {
  //   this.major = major;
  //   this.className = className;
  //   this.grade = grade;
  // }

  // 2번
  // Student({
  //   required String name,
  //   required int age,
  //   required String major,
  //   required String className,
  //   required String grade,
  // })  : this.major = major,
  //       this.className = className,
  //       this.grade = grade,
  //       super(
  //           name: name,
  //           age: age); // 이런 식으로 작성할 경우, super(부모 거)를 맨 밑에 작성해줘야 오류가 발생하지 않는다.

  // 3번
  // Student({
  //   required String name,
  //   required int age,
  //   required this.major,
  //   required this.className,
  //   required this.grade,
  // }) : super(name: name, age: age);

  // 4번 (최대로 간소화)
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

  // @override : 부모 클래스로 상속받은 동일한 이름의 메소드를 재정의. 근데 다트에서는 이 표시 없어도 적용 가능하긴 한데, 협업을 위해 가능하면 쓰라고 권고.
  @override
  void sayHello() {
    super.sayHello(); // super. 을 이용해서 부모 클래스의 sayHello()를 실행시킬 수 있다.
    print('안녕하세요. 제 이름은 $name입니다. 강의실는 $department입니다.');
    super.sayHello(); // 부모의 메소드를 그대로 불러오는 거라서, 순서가 뒤에 나와도 상관없다.
  }
}
