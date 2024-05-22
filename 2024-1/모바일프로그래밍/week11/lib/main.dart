import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Counter(
          initialNumber: 2,
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  final int initialNumber;
  const Counter({
    super.key,
    required this.initialNumber,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 5;
  // var counter = widget.initialNumber;

  void _increaseCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    counter = widget.initialNumber;
    // widget object : Counter 본래 위젯에서 값을 받아오는 방법. 근데, widget은 인스턴스 멤버 초기화 과정에서는 사용불가능하다. 본래 위젯에 해당 state가 존재하는지를 아직 알 수 없는 상황이기 때문이다.
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Click Count',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            '$counter',
            style: const TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: _increaseCounter,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
