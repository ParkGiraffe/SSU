import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:week12_todo_list/componets/drawer_menu_button.dart';
import 'package:week12_todo_list/screens/drawer_screen.dart';
import '../constants/todo_colors.dart';
import '../models/todo_model.dart';
import 'todo_modify_dialog.dart';
import '../componets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Todo> todoList = [];
  var todoList = Hive.box<Todo>('todoList');
  Iterable<Todo> _searchedTodoItems = [];

  @override
  void initState() {
    super.initState();
    _searchedTodoItems = todoList.values;
  }

  void _handleCheckTodoItem(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
      todoList.put(todo.id, todo); // 내부 데이터를 수정할 때는 put 메소드를 활용하기.
    });
  }

  void _addTodoItem(String todoContent) {
    if (todoContent.trim().isNotEmpty) {
      String createdAt = DateTime.now().toString();
      setState(() {
        todoList.put(
            createdAt,
            Todo(
              id: createdAt, // Todo의 id와 hive 데이터의 id를 동일하게 가져가면, 나중에 추가와 지우기를 할 때 아주 편함.
              todoContent: todoContent,
            ));
      });
      // _TodoAddBoxController.clear();
    }
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
      // todoList.removeWhere((element) => element.id == id);

      todoList.delete(id);
    });

    void _filtrateTodoList(String keyword) {
      Iterable<Todo> results = [];
      if (keyword.isEmpty) {
        results = todoList.values;
      } else {
        results = todoList.values.where((item) =>
            item.todoContent.toLowerCase().contains(keyword.toLowerCase()));
      }
      setState(() {
        _searchedTodoItems = results;
      });
    }
  }

  // 할 일의 이름을 변경하는 팝업 띄우기
  void _showModifyPopup(Todo todo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TodoModifyDialog(
          todo: todo,
          onModifiedTodo: _modifyTodoItem,
        );
      },
    );
  }

  void _modifyTodoItem(String modifiedTodoContent, Todo todo) {
    setState(() {
      todo.todoContent = modifiedTodoContent;
      todoList.put(todo.id, todo);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TodoColors.background,
      drawer: const DrawerScreen(),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: TodoColors.background,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: TodoColors.background,
        leading: DrawerMenuButton(),
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
                        todo: _searchedTodoItems
                            .elementAt(_searchedTodoItems.length - index),
                        onCheckedTodo: _handleCheckTodoItem,
                        onDeleteTodo: _deleteTodoItem,
                        onModifyTodo: _showModifyPopup,
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
