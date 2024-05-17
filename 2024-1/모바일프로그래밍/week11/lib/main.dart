import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _bgColor = Colors.amber;
  bool _isCreated = false;
  Color _squareColor = Colors.red;

  void _handleBgColor() {
    setState(() {
      _bgColor = _bgColor == Colors.amber ? Colors.white : Colors.amber;
    });
  }

  void _handleCreatingSquare() {
    setState(() {
      _isCreated = !_isCreated;
    });
  }

  void _handleSquareColor() {
    setState(() {
      _squareColor = _squareColor == Colors.red ? Colors.blue : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: _handleBgColor,
        child: Scaffold(
          backgroundColor: _bgColor,
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _isCreated
                          ? Square(
                              color: _squareColor,
                            )
                          : const SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _handleCreatingSquare,
                            child: Text(_isCreated ? '삭제' : '생성'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: _isCreated ? _handleSquareColor : null,
                            child: const Text('색변경'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Square extends StatefulWidget {
  final Color color;

  const Square({
    super.key,
    required this.color,
  });

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  int counter = 0;
  void _increaseCounter() {
    setState(() {
      print('Called setState!!');
      counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    print('Called initState!!');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Called didChangeDependencies!!');
  }

  @override
  void didUpdateWidget(covariant Square oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Called didUpdateWidget!!');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('Called deactivate!!');
  }

  @override
  void dispose() {
    super.dispose();
    print('Called dispose!!');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: widget.color,
      child: Center(
        child: GestureDetector(
          onTap: _increaseCounter,
          child: Text(
            '$counter',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
