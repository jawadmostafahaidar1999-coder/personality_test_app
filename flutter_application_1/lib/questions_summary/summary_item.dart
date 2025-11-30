import 'package:flutter/material.dart';
import 'package:flutter_application_1/questions_summary/question_number.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.element, {super.key});

  final Map<String, Object> element;

  @override
  Widget build(BuildContext context) {
    bool isCorrect =
        element['correct-personality'] == element['chosen-personality'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionNumber(
            isCorrect: isCorrect,
            number: (element['question-index'] as int) + 1,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  element['question-text'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Correct: ${(element['correct-personality'] as String)}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 44, 112, 47),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'You chose: ${(element['chosen-personality'] as String)}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 126, 34, 27),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
