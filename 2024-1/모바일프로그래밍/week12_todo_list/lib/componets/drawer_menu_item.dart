import 'package:flutter/material.dart';
import 'package:week12_todo_list/constants/todo_colors.dart';
import 'package:week12_todo_list/screens/past_screen.dart';
import 'package:week12_todo_list/screens/today_screen.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // Navigator.pop(
        //     context); // 다른 페이지로 이동하면, drawer 페이지는 닫아서 page stack에 안 남게 함. 하지만 이 방식은 다른 페이지를 닫는 오류가 발생할 수 있음.

        if (Scaffold.of(context).isDrawerOpen) {
          Scaffold.of(context).closeDrawer(); // drawer만 찾아서 닫는 기능
        }

        switch (title) {
          case '오늘 할 일':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const TodayScreen();
                },
              ),
            );

          case '지난 할 일':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const PastScreen();
                },
              ),
            );

          default:
            return;
        }
      },
      leading: Icon(
        icon,
        color: TodoColors.point,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: TodoColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Padding(
        padding: EdgeInsets.all(4),
        child: Text(
          '10',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
