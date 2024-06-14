
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import '../constants/todo_colors.dart';
import '../models/todo_model.dart';
import '../util/utils.dart';
import '../components/bottom_button.dart';
import '../components/drawer_menu_button.dart';
import '../components/todo_item.dart';
import 'drawer_screen.dart';
import 'todo_modify_dialog.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({
    super.key,
    this.title = "모든 할 일",
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var todoList = Hive.box<Todo>('todoList');
  final _todoAddBoxController = TextEditingController();
  final _todoSearchBoxController = TextEditingController();
  Iterable<Todo> _searchedTodoItems = [];

  @override
  void initState() {
    super.initState();
    // _searchedTodoItems = todoList.values;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _searchedTodoItems = createTodoList(
      title: widget.title,
      list: todoList.values,
    );
  }

  void _handleCheckTodoItem(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
      todoList.put(todo.id, todo);
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoList.delete(id);
    });
  }

  void _addTodoItem(String todoContent) {
    if (todoContent.trim().isNotEmpty) {
      String createdAt = DateTime.now().toString();
      setState(() {
        todoList.put(
          createdAt,
          Todo(
            id: createdAt,
            todoContent: todoContent,
          ),
        );
      });
      _todoAddBoxController.clear();
    }
  }

  void _filtrateTodoList(String keyword) {
    Iterable<Todo> results = [];
    if (keyword.isEmpty) {
      results = todoList.values;
    } else {
      results = todoList.values
          .where((todo) => todo.todoContent.contains(keyword.toLowerCase()));
    }

    setState(() {
      _searchedTodoItems = results;
    });
  }

  void _showModifyPopup(Todo todo) {
    showDialog(
        context: context,
        builder: (context) {
          return TodoModifyDialog(
            todo: todo,
            onModifiedTodo: _modifyTodoItem,
          );
        });
  }

  void _modifyTodoItem(String modifiedTodoContent, Todo todo) {
    setState(() {
      todo.todoContent = modifiedTodoContent;
      todoList.put(todo.id, todo);
    });
    Navigator.pop(context);
  }

  void _completeAllItems() {
    setState(() {
      for (var todo in todoList.values) {
        if (_searchedTodoItems.contains(todo)) {
          todo.isDone = true;
          todoList.put(todo.id, todo);
        }
      }
    });
  }

  void _deleteAllItems() {
    setState(() {
      for (var todo in todoList.values) {
        if (_searchedTodoItems.contains(todo)) {
          todoList.delete(todo.id);
        }
      }
    });
  }

  Widget _createBottomWidget(String title) {
    switch (title) {
      case "지난 할 일":
        return Row(
          children: [
            BottomButton(text: "모두 완료", onPressed: _completeAllItems),
            const SizedBox(
              width: 10,
            ),
            BottomButton(text: "모두 삭제", onPressed: _deleteAllItems)
          ],
        );

      case "완료된 할 일":
        return Row(
          children: [
            BottomButton(text: "모두 삭제", onPressed: _deleteAllItems),
          ],
        );

      default:
        return _TodoAddBox(
          controller: _todoAddBoxController,
          onSubmitted: _addTodoItem,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TodoColors.background,
      drawer: const DrawerScreen(),
      appBar: AppBar(
        backgroundColor: TodoColors.background,
        leading: const DrawerMenuButton(),
        centerTitle: true,
        title: const Text(
          "Todo App",
          style: TextStyle(
            color: TodoColors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.account_circle,
              color: TodoColors.point,
              size: 36,
            ),
          )
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _TodoSearchBox(
                controller: _todoSearchBoxController,
                onChanged: _filtrateTodoList,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: _searchedTodoItems.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }
                    return TodoItem(
                      todo: _searchedTodoItems
                          .elementAt(_searchedTodoItems.length - index),
                      onCheckTodo: _handleCheckTodoItem,
                      onDeleteTodo: _deleteTodoItem,
                      onModifyTodo: _showModifyPopup,
                    );
                  },
                  separatorBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox.shrink();
                    }
                    return const SizedBox(
                      height: 5,
                    );
                  },
                ),
              ),
              // _TodoAddBox(
              //   controller: _todoAddBoxController,
              //   onSubmitted: _addTodoItem,
              // ),
              _createBottomWidget(widget.title),
            ],
          ),
        ),
      ),
    );
  }
}

class _TodoSearchBox extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const _TodoSearchBox({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: TodoColors.black,
            size: 28,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                onTapOutside: (e) {
                  controller.clear();
                },
                decoration: const InputDecoration(
                  hintText: "할 일 검색",
                  hintStyle: TextStyle(
                    color: TodoColors.grey,
                    fontSize: 16,
                    height: 1.8,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _TodoAddBox extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const _TodoAddBox({
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.add_rounded,
            color: TodoColors.black,
            size: 28,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: TextField(
                controller: controller,
                onSubmitted: onSubmitted,
                onTapOutside: (e) {
                  controller.clear();
                },
                cursorHeight: 28,
                decoration: const InputDecoration(
                  hintText: "할 일 추가",
                  hintStyle: TextStyle(
                    height: 1.8,
                    color: TodoColors.grey,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
