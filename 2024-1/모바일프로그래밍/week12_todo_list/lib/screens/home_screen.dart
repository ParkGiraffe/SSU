import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:week12_todo_list/constants/todo_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TodoColors.background,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: TodoColors.background,
        ),
        leading: const Icon(Icons.menu),
        title: const Text('Todo App'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.account_circle,
              size: 36,
              color: TodoColors.point,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          child: Column(
            children: [
              TodoSearchBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoSearchBox extends StatelessWidget {
  const TodoSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: const Row(
        children: [
          Icon(
            Icons.search,
            color: TodoColors.black,
            size: 28,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '할 일 검색',
                    hintStyle: TextStyle(
                      color: TodoColors.grey,
                      fontSize: 16,
                      height: 2,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
