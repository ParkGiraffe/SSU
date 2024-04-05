void main() {
  int sumNumbers({
    required int x,
    int y = 0,
    int z = 0,
  }) =>
      x + y + z;

  print(sumNumbers(x: 10));
}
