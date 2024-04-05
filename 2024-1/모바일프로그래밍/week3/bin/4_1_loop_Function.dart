import 'dart:io';

enum Status { Initialized, Authenticating, Authenticated, Unauthenticated }

void main() {
  // for loop문
  for (int i = 0; i < 10; i++) {
    print(i);
  }

  List<int> list = [10, 20, 30];
  for (int i = 0; i < list.length; i++) {
    print(list[i]);
  }

  for (int element in list) {
    print(element);
  }

  List<String> stringList = ['a', 'b', 'c'];
  for (String str in stringList) {
    print(str);
  }

  // while
  const password = '1234';
  var status = Status.Initialized;
  while (status != Status.Authenticated) {
    print('비밀번호를 입력해주세요: ');
    var input = stdin.readLineSync();
    if (input == password) {
      print('인증되었습니다.');
      status = Status.Authenticated;
    } else {
      print('비밀번호가 틀렸습니다.');
    }
  }

  // forEach
  List<int> numbers = [1, 2, 3];
  numbers.forEach((element) {
    print(element);
  });

  // 함수 - 함수호출
  functionName();
  sumNumbers(1, 2, 3);
}

// 함수
void functionName() {
  // void : 공허한 <- 아무것도 출력하는 게 없다.
  print('이것은 함수입니다.');
}

functionName2() {
  print('이것은 함수입니다.');
}

// 세 개의 숫자를 더하고, 그 결과가 홀수인지 짝수인지 판별
sumNumbers(int x, [int y = 0, int z = 0]) {
  // 대괄호로 묶이면 optional parameter가 된다. y와 z의 값을 안 넣어줘도 대체 가능. 대신에 기본값(default value)을 미리 넣어줘야 한다.
  // int x = 10;
  // int y = 20;
  // int z = 30;
  int sum = x + y + z;
  String oddEven;

  if (sum.isOdd) {
    oddEven = '홀수';
  } else {
    oddEven = '짝수';
  }

  print('세 수의 합은 $sum이고, $oddEven입니다.');
}

// Named Parameter - 중괄호로 묶고, requried 키워드 사용. 이럴 경우, sumNumbers2(x: 10, y:20 ,z: 30)과 같은 형식으로, 순서 상관 없이 인수의 이름을 붙여서 값을 전달 할 수 있다.
sumNumbers2({int x = 10, required int y, required int z}) {
  // 대괄호로 묶이면 optional parameter가 된다. y와 z의 값을 안 넣어줘도 대체 가능. 대신에 기본값(default value)을 미리 넣어줘야 한다.
  // int x = 10;
  // int y = 20;
  // int z = 30;
  int sum = x + y + z;
  String oddEven;

  if (sum.isOdd) {
    oddEven = '홀수';
  } else {
    oddEven = '짝수';
  }

  print('세 수의 합은 $sum이고, $oddEven입니다.');
}

int sumNumbers3(int x, int y) {
  // 반환값의 타입을 앞에 써주기.
  return x + y;
}
