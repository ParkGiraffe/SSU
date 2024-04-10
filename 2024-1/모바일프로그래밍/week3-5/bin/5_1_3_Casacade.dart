void main() {
  /*
  // 원래 방식
  var someone = Student(name: '아무개', major: '글로벌미디어학부', grade: 'C');
  someone.name = '이재용';
  someone.major = 'AI융합학부';
  someone.grade = 'A';
  */

  // Cascade 연산자 방식
  var someone = Student(name: '아무개', major: '글로벌미디어학부', grade: 'C') // ; 붙이지 않기.
    ..name = '이재용' //..으로 연결
    ..major = 'AI융합학부'
    ..grade = 'A'
    ..sayHello(); // 심지어 메소드를 실행할 수도 있다.

  print(someone);
} // 주석

class Student {
  String name;
  String major;
  String grade;

  Student({required this.name, required this.major, required this.grade});

  void sayHello() =>
      print('안녕하세요. 제 이름은 $name입니다. 전공은 $major이고 학점은 $grade입니다.');
}
