void main() {
  Human giarffe = Human(name: 'giarffe', age: 25);
  giarffe.sayHello();
}

class Human {
  // 생성자
  /*
  late String name; // 일단 property를 만든 후, 생성자에 값을 넣겠다는 의미로, late 사용.
  late int age;
  Human(String name, int age) {
    this.name = name; // late 키워드를 사용하면, 이와 같은 구문으로 작성해도 오류 없음.
    this.age = age;
  }
  */

  /*
  //late 키워드 없이 쓰려면, 아래처럼 적으면 된다.
  final String name; // final : 수정 불가능.
  int age;
  Human({required this.name, required this.age});
  */

  // 파이썬처럼 :을 이용해서 생성자 함수를 선언할 수 있다.
  late String name; // 일단 property를 만든 후, 생성자에 값을 넣겠다는 의미로, late 사용.
  late int age;
  Human(String name, int age)
      : this.name = name, //,로 이어 붙이고
        this.age = age; //;로 생성자 함수 작성을 마무리한다.

  void sayHello() {
    print('안녕하세요. 제 이름은 $name 입니다.');
  }

  // String name = '박기린';
  // int age = 25;

  // void sayHello() {
  //   print('안녕하세요. 제 이름은 $name 입니다.');
  // }
}
