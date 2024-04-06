// dart는 '_'를 이용해서 private 적용.
// 근데 대부분 private는 클래스 단위로 적용되는 게 일반적인데, dart는 패키지(라이브러리, 파일)기준으로 적용..
class Human {
  late String _name;
  late int _age;

  Human({required String name, required int age}) {
    // private 프로퍼티에는 간소화 방식의 생성자 함수 작성이 불가능하다.
    this._age = age;
    this._name = name;
  }

  void _sayHello() => print('안녕하세요. 제 이름은 $_name입니다. 나이는 $_age입니다.');
}
