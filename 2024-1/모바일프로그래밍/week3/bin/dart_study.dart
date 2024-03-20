void main() {
  // String : 문자열을 저장하는 타입
  String greeting = 'Hello World!';
  String greeting2 = "Hello 'World!'";
  String greeting3 = 'Hello "World!"';
  String greeting4 = '''Hello World!''';
  String greeting5 = '''Hello
  World!
    yeah
  ''';

  // int : 정수를 저장하는 타입
  int integer = 1;

  // double : 실수를 저장하는 타입
  double real = 3.14;
  double real1 = 1; // output : 1.0 <- 실수타입으로 변환해서 출력을 해준다.

  // num : 모든 수를 저장할 수 있는 타입. int와 double의 상위 타입. num 안에 들어온 숫자의 유형에 따라, 자동으로 int나 double로 형변환이 일어난다. 정확히는 num 객체를 int와 double가 상속받는데, num 값의 형태에 따라 적절하게 child 객체로 지정해주는 형식이다. flutter는 모든 타입을 객체 형태로 관리하기 때문에 이와 같은 기능이 가능하다. 그래서 number를 쓰고 뒤에 dot notation을 붙이면 여러가지 내장 메소드를 사용할 수 있다. int, String, bool 등 모든 것이 내장 메소드를 지니고, 타고 올라가면 Object 클래스를 상속한다. JS의 프로토타입처럼 타입들이 전부 객체로부터 상속받는 형태이다.
  num number = 0;

  // bool : true(참) 또는 false(거짓)을 저장하는 타입.
  bool isTrue = true;
  bool isFalse = false;

  // 이 모든 데이터 타입들은 Object 클래스를 상속한다. 그래서 내장메소드와 property를 사용할 수 있다.

  // Type Annotation vs Type Inference
  // Type Annotation : 미리 개발자가 변수 선언 때에 타입을 명시
  // num, int, double, string, bool

  // Type Inference : 변수에 대입되는 값을 통해 타입이 동적으로 결정 <- JS의 느낌
  // var, dynamic

  var varString = 'mobile';
  dynamic dynamicValue = 'mobile';

  print(varString.runtimeType); // output : String
  print(dynamicValue.runtimeType); // output : String

  // varString = 5; <- var로 값을 하나 넣어서 타입이 결정되면, 다른 타입을 넣었을 때 오류 발생
  varString = 'hello'; // <- 한번 String으로 결정되면, String만 넣기.

  dynamicValue = 5; // <- 반대로 dynamic 형태는 다른 타입의 값을 넣어도 인정해준다.
  print(dynamicValue.runtimeType); // output : int
  dynamicValue = 5.1;
  print(dynamicValue.runtimeType); // output : double

  // var에 아무것도 선언하지 않으면, dynamic으로 작동한다. (단, 권장하지 않는다. 경고표시 띄움)
  var somedata;
  print(somedata.runtimeType); // ouput: null;
  somedata = 'mobile';
  print(somedata.runtimeType); // ouput: String;
  somedata = 5;
  print(somedata.runtimeType); // ouput: int; <-타입변환도 가능

  // Dart의 상수 : const, final
  // 한 번 값이 대입되면 변경할 수 없음
  // 타입을 명시하지 않고 final을 작성하면 dynamic 타입으로 설정
  // 타입을 명시할 경우 const 혹은 final 작성 후 타입 작성

  const String className = '모바일프로그래밍';
  // className = 'Mobile'; <- 값을 변경하면 오류 발생;

  final className2; // final의 경우, 아직 클래스네임이 뭔지는 모른데 변하진 않을 거 같은 값이 있다면, 타입이랑 값 없이 final 키워드 뒤에 상수 이름만 적어준다.
  className2 = '모바일 프로그래밍'; // 그리고 나중에 값을 할당한다. 이때는 dynamic 형태로 동적으로 값을 받아들인다.
  final String className3; // 물론 final 뒤에도 타입을 명시할 수 있다.
  // className2 = '안녕'; // 그러면 한 번 저장된 후로 값을 바꿀 수 없다.
  // cosnt String className2 <- const는 프로그램 시작 시점에서 값을 무조건 할당해야 한다. 시작 지점에서 값을 할당할 수 없는 값일 경우 final로 설정.

  final today =
      'hello'; // <- final을 const처럼 사용할 수는 있는데, 이러면 final의 의미가 퇴색된다. 이런 경우 const만 쓰자.

  final now = DateTime.now(); // final은 가능한데
  // const now2 = DateTime.now(); // const는 불가능하다. DateTime.now()는 프로그램이 시작되고 나서 현재 시각을 가져오다보니, 프로그램이 시작되는 순간에는 값이 결정되지 않는다. 그래서 const를 쓰면, 값이 없는 것으로 판단하여 오류가 발생한다. 이럴 때 final이 유용하게 쓰인다.

  int num1 = 1;
  double realNum = 3.14;
  String hello = 'hello';
  String name = 'giraffe';

  print(num1 + realNum); // output : 4.14000000000001
  print(hello + name); // output : hellogiraffe

  // print(num + hello); <- JS와는 다르게 다른 타입 끼리 + 불가능 (type coercion이 안 일어남)
  print('hello' * 3); // 신기하게 + 연산자는 안 되면서, * 연산자는 String과 num끼리 작동함.

  // String Interpolation : 달러 사인을 이용해서 출력하는 방식이 있다.
  print('$real 입니다');
  print('${real.runtimeType} 입니다');
  print('${real + realNum} 입니다');
  print('$hello $name');

  // 타입 비교 연산자 is
  print(num1 is int); // output : true;
  print(num1 is String); // output : false;
  print(num1 is! int); // output : false;
  print(num1 is! String); // output : true;

  // 3주차 자료
  List fruits = ['apple', 'banana', 'grape'];
  print(fruits);
  print(fruits[0]); // output:'apple'
  // print(fruits[5]); // RangeError 발생. null을 반환하지 않음.
  fruits[0] = 'mango';
  fruits[0] = 1; // List의 타입을 고정하지 않으면, 여러 값을 넣을 수 있다.
  // fruits[5] = 'mango'; // RangeError 발생. 이렇게 없는 인덱스에 값을 넣을수는 없다.

  // List에 데이터 타입 고정시키기.
  // <제네릭> 사용.
  List<String> fruits2 = ['apple', 'banana', 'grape'];
  print(fruits2);
  // fruits2[0] = 1; // int로 설정하려고 하면, 에러 발생.

  // List의 메소드와 property
  print(fruits.length); // 리스트의 길이
  fruits.add('orange'); // List에 Push
  fruits.indexOf('orange'); // 특정 요소의 인덱스 찾기
  fruits.remove('orange'); // 특정 값 요소를 제거하기
  fruits.removeAt(0); // n번 인덱스 제거
  print(fruits);

  // Set - 중괄호 사용. 중복데이터 허용하지 않음. 요소의 순서는 별로 안 중요하다.
  Set fruitsSet = {'apple', 'banana', 'grape'};
  fruitsSet.add('orange');
  fruitsSet.add('grape'); // 이미 있는 값을 또 추가하려 하면, 중복을 확인한 후, 무시.
  print(fruitsSet); // 그래서 grape는 두 번 담았지만, 한 번만 출력됨.
  print(fruitsSet.elementAt(0)); // 이러한 방법으로 인덱스 기반 검색을 '굳이' 할 수 있긴하다.
  print(fruits.elementAt(0)); // 참고로 elementAt()은 리스트에서도 똑같이 사용 가능.

  // Map {key : value} 형태로 저장.
  // key와 value의 타입은 아무거나 가능.
  // Index가 아니라 key를 사용해서 데이터에 접근. -> key값이 절대로 중복되어서는 안 된다.
  Map zipcode = {
    "동작구": 06978,
    "은평구": 03447,
    "동작구": 03984,
  };

  print(
      zipcode); // {동작구: 3984, 은평구: 3447} <- 만약 key가 중복되면, 이전의 value에 새로운 value를 덮어씌워버린다.

  // Map에 <제네릭>을 사용해서, key와 value의 타입을 고정하기.
  Map<String, int> zipcode2 = {
    "동작구": 06978,
    "은평구": 03447,
    "동작구": 03984,
  };

  // Map의 key와 value의 데이터 타입에 컬렉션 타입(list, set, map)도 설정할 수 있다. 근데 key는 주로 String.
  Map<String, List<int>> zipcode3 = {
    "동작구": [0, 6, 9, 7, 8],
  };
}
