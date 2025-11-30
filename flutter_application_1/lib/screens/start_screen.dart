import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/quiz_button.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback startQuiz;
  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Discover Your\nPersonality Type!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('❤️', style: TextStyle(fontSize: 28)),
              SizedBox(width: 10),
              Text('📚', style: TextStyle(fontSize: 28)),
              SizedBox(width: 10),
              Text('🧠', style: TextStyle(fontSize: 28)),
            ],
          ),
          const SizedBox(height: 36),
          QuizButton(
            onTap: startQuiz,
            icon: Icons.arrow_right_alt,
            text: 'Start Test',
          ),
        ],
      ),
    );
  }
}
