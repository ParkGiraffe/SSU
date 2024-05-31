import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:week12_todo_list/constants/todo_colors.dart';
import 'package:week12_todo_list/models/todo_model.dart';
import 'package:week12_todo_list/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = Todo.createDummyTodoList();

  void _handleCheckTodoItem(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      /*
      1. for 문
      for (var todoItem in todoList) {
        if (todoItem.id == id) {
          todoList.remove(todoItem);
          return; // break를 안 걸면, 반복중에 리스트 요소가 사라진 탓에, 인덱스 탐색에 오류가 발생한다. (꼬임이 발생)
        }
      }
      */

      // 2. List 타입에서 제공하는 removeWhere method
      todoList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TodoColors.background,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: TodoColors.background,
        ),
        backgroundColor: TodoColors.background,
        leading: const Icon(Icons.menu),
        title: const Text(
          'Todo App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const _TodoSearchBox(),
              Expanded(
                child: ListView.separated(
                  //ListView 내부에 스크롤 기능이 있다.
                  itemCount: todoList.length,
                  separatorBuilder: (context, index) {
                    if (index == 0) return const SizedBox.shrink();
                    return const SizedBox(
                      height: 5,
                    );
                  },
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        child: const Text(
                          '모든 할 일',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    } else {
                      return TodoItem(
                        todo: todoList[index - 1],
                        onCheckedTodo: _handleCheckTodoItem,
                        onDeleteTodo: _deleteTodoItem,
                      );
                    }
                  },
                ),
              ),
              const _TodoAddBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TodoSearchBox extends StatelessWidget {
  const _TodoSearchBox();

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
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TodoAddBox extends StatelessWidget {
  const _TodoAddBox();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.add_rounded,
            color: TodoColors.black,
            size: 28,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '할 일 추가',
                  hintStyle: TextStyle(
                    color: TodoColors.grey,
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
