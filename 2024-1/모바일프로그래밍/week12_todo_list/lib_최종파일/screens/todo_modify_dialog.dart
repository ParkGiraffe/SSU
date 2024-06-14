import 'package:flutter/material.dart';
import '../constants/todo_colors.dart';
import '../models/todo_model.dart';

class TodoModifyDialog extends StatelessWidget {
  final Todo todo;
  final Function(String, Todo) onModifiedTodo;

  const TodoModifyDialog({
    super.key,
    required this.todo,
    required this.onModifiedTodo,
  });

  @override
  Widget build(BuildContext context) {
    final todoModifyDialogController = TextEditingController.fromValue(
      TextEditingValue(text: todo.todoContent),
    );

    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      title: const Text(
        "할 일 수정",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.edit_note_rounded,
            size: 28,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: TextField(
                controller: todoModifyDialogController,
                onSubmitted: (modifiedTodoContent) {
                  onModifiedTodo(modifiedTodoContent, todo);
                },
                autofocus: true,
                minLines: 1,
                maxLines: 3,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  isDense: true,
                  border: InputBorder.none,
                  hintText: "할 일 수정",
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            onModifiedTodo(todoModifyDialogController.text, todo);
          },
          child: const Text(
            "완료",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: TodoColors.point,
            ),
          ),
        )
      ],
    );
  }
}
