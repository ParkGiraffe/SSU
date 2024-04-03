void main() {
  Human giraffe = Human.createKorean(name: 'giraffe', age: 25, height: 183);
  giraffe.printInfo();
}

class Human {
  String name;
  int age;
  double height;
  String nation;

  Human(
      {required this.name,
      required this.age,
      required this.height,
      required this.nation});

  // Named Constructor

/*
  // 원래 형태
  Human.createKorean({
    required String name,
    required int age,
    required double height,
  })  : this.name = name,
        this.age = 0,
        this.nation = '대한민국',
        this.height = height;
*/
  // 최신 방식
  Human.createKorean({
    required this.name,
    required this.age,
    required this.height,
  }) : nation = '대한민국';

  void printInfo() {
    print(name);
    print(age);
    print(height);
    print(nation);
  }
}
