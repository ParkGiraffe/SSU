void main() {
  Human giarffe = Human(name: 'giarffe', age: 25);
  giarffe.sayHello();
}

class Human {
  final String name; // final : 수정 불가능.
  int age;

  // 생성자
  Human({required this.name, required this.age});

  /*
  late String name;
  late int age;
  Human(String name, int age) {
    this.name = name;
    this.age = age;
  }
  */

  void sayHello() {
    print('안녕하세요. 제 이름은 $name 입니다.');
  }

  // String name = '박기린';
  // int age = 25;

  // void sayHello() {
  //   print('안녕하세요. 제 이름은 $name 입니다.');
  // }
}
