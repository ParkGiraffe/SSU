// 추상클래스는 일종의 설명서.
// 추상클래스를 상속받는 자식클래스는 무조건 아래의 설명서를 따라서 전부 작성해서 구현해줄 의무가 있다.
abstract class Human {
  String name;
  int age;

  Human({required this.name, required this.age});

  void sayHello();
}
