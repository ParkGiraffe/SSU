import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:week12_todo_list/constants/todo_colors.dart';
import 'package:week12_todo_list/models/todo_model.dart';

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
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      title: const Text(
        '할 일 수정',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Row(
        children: [
          const Icon(
            Icons.edit_note_rounded,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              width: double
                  .maxFinite, // maxFinite : 현재 상황에서 가져갈 수 있는 최대값을 사용한다는 의미
              child: TextField(
                onSubmitted: (value) {
                  onModifiedTodo(value, todo);
                },
                textInputAction: TextInputAction
                    .done, // 휴대폰 키보드의 enter키를 눌렀을 때, 어떻게 작동할지를 설정하는 속성이다. done : 한 줄 내리기가 아니라 submit이 되게 함.
                autofocus: true,
                controller: todoModifyDialogController,
                minLines: 1,
                maxLines: 3,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  isDense: true,
                  hintText: '할 일 수정',
                  border: InputBorder.none,
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
            '완료',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: TodoColors.point,
            ),
          ),
        ),
      ],
    );
  }
}
