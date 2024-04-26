import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Hello Giraffe!',
              ),
            ),
            backgroundColor: Colors.orange,
          ),
          body: SizedBox(
            width: 200,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(color: Colors.red),
            ),
          )),
    );
  }
}
