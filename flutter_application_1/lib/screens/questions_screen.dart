import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/answer_button.dart';
import 'package:flutter_application_1/data/questions.dart';
import '../models/question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(int answerIndex) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionIndex = 0;

  void answerQuestion(int idx) {
    widget.onSelectAnswer(idx);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = questions[questionIndex];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            current.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          ...List.generate(current.answers.length, (i) {
            final ans = current.answers[i];
            return AnswerButton(
              answerText: ans.text,
              onTap: () => answerQuestion(i),
            );
          }),
        ],
      ),
    );
  }
}
