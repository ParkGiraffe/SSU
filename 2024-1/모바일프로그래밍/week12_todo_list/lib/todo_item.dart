import 'package:flutter/material.dart';
import 'package:week12_todo_list/constants/todo_colors.dart';
import 'package:week12_todo_list/models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onCheckedTodo;
  final Function(String) onDeleteTodo;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onCheckedTodo,
    required this.onDeleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Row(
        children: [
          IconButton(
            // Button 터치 영역은 최소 48px 크기를 갖춰야 원활히 사용된다는 연구 -> 그래서 플러터 내부적으로 48 터치 영역을 보장함. 따라서, 아이콘 크기만 바꿔도, 터치 영역은 그대로임. 심지어 IconButton의 padding을 수정해도 변화가 없다.
            icon: todo.isDone
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            highlightColor: Colors.transparent, // 터치 할 때 음영 제거.
            color: TodoColors.point,
            constraints:
                const BoxConstraints(), // 모든 크기를 가진 widget은 constraints 속성을 가진다. 여기에 최소 최대 크기값이 지정되는데, IconButton의 기본 48px은 여기에서 수정을 할 수 있다.
            style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize
                    .shrinkWrap), // tapTargetSize: 터치가능 영역 | shrinkWrap - 주어진 영역 중에 최소 영역(아이콘 크기)만 사용,
            // tapTargetSize와 BoxConstraints 둘 다 같이 수정해야 버튼의 크기가 줄어든다.
            onPressed: () {
              // print('click');
              onCheckedTodo(todo);
            },
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                todo.todoContent,
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
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 18,
                ),
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(),
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                highlightColor: Colors.transparent,
                onPressed: () {
                  onDeleteTodo(todo.id);
                },
              ))
        ],
      ),
    );
  }
}
