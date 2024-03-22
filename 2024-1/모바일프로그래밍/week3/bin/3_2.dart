enum Status { Initialized, Authenticating, Authenticated, Unauthenticated }
// enum은 main 바깥에 선언.
// enum 안에는 복합적인 다른 타입의 값들도 넣을 수 있다.

void main() {
  int number = 10;
  int? number2 = 10;

  // number1 = null; // <- null 값이 들어가면 에러 발생.
  number2 = null; // <- null 값이 들어가도 오류 x;

  int number3;
  int? number4;
  // print(number3); // <- 값을 할당하지 않으면 오류 발생.
  print(number4); // <- 값을 할당하지 않아도 오류 발생하지 않음.

  // var과 dynamic의 Nullable 여부
  // var? data1; // 오류 발생. var은 특정 타입을 선언하기 위해 사용하는 임시 키워드이다. 그래서 nullable을 받아들이지 못한다.
  dynamic?
      data2; // dynamic은 모든 타입이든 들어갈 수 있는 변수라서, null도 애초에 들어갈 수 있게 되어 있다. (?)가 따로 필요하지도 않다.

  List<String?> fruits = [
    'apple',
    null,
    'grape'
  ]; //List의 제네릭 안에 nullalbe 지정을 해주면, null 값도 list 안에 넣을 수 있다.

  List<String?>? fruits2; // List의 nullable은 제네릭 뒤에 붙인다.
  print(fruits2);

  Map<String?, dynamic>? zipcode = {
    '동작구': 06978,
    null: null,
    '마포구': null,
  };

  List<int?> numbers = [1, 2, 3, null, 5];
  numbers[3] = 4;

  // int fourthNumber = numbers[3]; // <- List<int?> 이기 때문에, int가 null일 수 있다는 가능성을 염두에 둬서, int 타입의 변수에 이걸 집어넣으려 하면 에러가 발생한다.

  // null assertion operator : !
  int fourthNumber =
      numbers[3]!; // ! : 구조적으로는 Null일 수 있지만, 절대로 Null값이 안 들어갈 거야! 라는 의미.
  // !를 썼음에도 null값이 들어가 있다면 오류 발생. <- 당장의 null safety 오류를 면피하기 위해 사용하진 말자.

  print(fourthNumber);

  // null 관련 연산자 : ??= 연산자
  // Nullalbe 변수에 null이 아닌 값만 대입하고자 할 때 사용
  String? name;
  name ??= 'John'; // Null일 경우에만 값을 할당.
  print(name); // output : John
  name ??= 'Park';
  print(name); // output : John

  // null 관련 연산자 : ?? 연산자
  // Nullable 변수의 값이 null일 때, Null을 대체할 값을 지정하고자 할 때 사용.
  String hello = 'Hello';
  String? name2;
  print('$hello, ${name2 ?? 'World'}!');

  // 제어문
  // if, else if, else

  // switch - case
  String status = 'Initialized';
  // 'Initialized', 'Authenticating', 'Authenticated', 'Unauthenticated'
  switch (status) {
    case 'Initialized':
      print('초기화');
      break;
    case 'Authenticating':
      print('인증 처리 중');
      break;
    case 'Authenticated':
      print('인증');
      break;
    case 'Unauthenticated':
      print('미인증');
      break;
  }

  // enum : main 함수 바깥에 선언해야하는 탓에, 맨 위에 있음.
  var status2 = Status.Authenticated;
  switch (status2) {
    case Status.Initialized:
      print('초기화');
      break;
    case Status.Authenticating:
      print('인증 처리 중');
      break;
    case Status.Authenticated:
      print('인증');
      break;
    case Status.Unauthenticated:
      print('미인증');
      break;
  }
}
