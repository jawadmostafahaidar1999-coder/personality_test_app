import 'package:flutter/material.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber({
    super.key,
    required this.isCorrect,
    required this.number,
  });

  final bool isCorrect;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green : Colors.red,
        shape: BoxShape.circle,
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
