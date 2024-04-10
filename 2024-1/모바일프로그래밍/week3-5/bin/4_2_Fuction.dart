void main() {
  Function func = testFunction(sumNumbers);
  print(func(x: 10, z: 20));
}

int sumNumbers({required int x, int y = 0, int z = 0}) {
  return x + y + z;
}

Function testFunction(Function someFunc) {
  // 함수를 반환하는 함수.
  return someFunc;
}

// 람다식(화살표 함수) 함수
int sumNumbers2({required int x, int y = 0, int z = 0}) => x + y + z;

// Dart는 JS와는 다르게, 화살표 함수에 여러 문장 쓰는 걸 거부.
// int sumNumbers3({required int x, int y = 0, int z = 0}) => {
//   int result = x + y + z;
//   return result;
// };


// 익명 함수
// 함수이름이 없고 일회성으로 사용되는 함수

/*
(var parameter) {
  print('익명함수');
};
*/

