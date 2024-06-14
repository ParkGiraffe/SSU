import '../models/todo_model.dart';

Iterable<Todo> createTodoList(
    {required String title, required Iterable<Todo> list}) {
  switch (title) {
    case "모든 할 일":
      return list;
    case "오늘 할 일":
      return list.where((todoItem) =>
          DateTime.now().toString().split(' ').first ==
          todoItem.id.split(' ').first);
    case "지난 할 일":
      return list.where((todoItem) =>
          DateTime.now().toString().split(' ').first !=
          todoItem.id.split(' ').first);
    case "진행 중인 할 일":
      return list.where((todoItem) => !todoItem.isDone);
    case "완료된 할 일":
      return list.where((todoItem) => todoItem.isDone);
    default:
      return list;
  }
}
