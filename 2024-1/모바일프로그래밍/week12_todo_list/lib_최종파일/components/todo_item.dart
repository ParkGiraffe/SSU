import 'package:flutter/material.dart';
import '../constants/todo_colors.dart';
import '../models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onCheckTodo;
  final Function(String) onDeleteTodo;
  final Function(Todo) onModifyTodo;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onCheckTodo,
    required this.onDeleteTodo,
    required this.onModifyTodo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Modify Todo Item");
        onModifyTodo(todo);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                print('Done or Ongoing TodoItem');
                onCheckTodo(todo);
              },
              padding: const EdgeInsets.all(0),
              constraints: const BoxConstraints(),
              highlightColor: Colors.transparent,
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: todo.isDone
                  ? const Icon(Icons.check_box)
                  : const Icon(Icons.check_box_outline_blank),
              color: TodoColors.point,
              iconSize: 28,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  todo.todoContent,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: TodoColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    decoration: todo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: TodoColors.point,
              ),
              child: IconButton(
                onPressed: () {
                  print('Delete Todo Item');
                  onDeleteTodo(todo.id);
                },
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(),
                highlightColor: Colors.transparent,
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(Icons.delete),
                color: Colors.white,
                iconSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
