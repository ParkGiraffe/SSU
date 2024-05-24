import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:week12_todo_list/constants/todo_colors.dart';
import 'package:week12_todo_list/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     systemNavigationBarColor: TodoColors.background,
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      home: const HomeScreen(),
    );
  }
}
