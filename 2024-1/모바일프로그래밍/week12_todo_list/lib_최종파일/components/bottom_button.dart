import 'package:flutter/material.dart';
import '../constants/todo_colors.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const BottomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: TodoColors.point,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
