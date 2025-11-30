import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/questions.dart';
import 'package:flutter_application_1/models/answer.dart';
import 'package:flutter_application_1/models/personality.dart';
import 'package:flutter_application_1/screens/start_screen.dart';
import 'package:flutter_application_1/screens/questions_screen.dart';
import 'package:flutter_application_1/screens/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreenName = 'start-screen';
  int questionIndex = 0;
  List<Personality> chosen = [];

  void switchToQuestions() {
    setState(() {
      activeScreenName = 'questions-screen';
      questionIndex = 0;
      chosen = [];
    });
  }

  void chooseAnswer(int answerIndex) {
    final Answer ans = questions[questionIndex].answers[answerIndex];
    chosen.add(ans.personality);

    if (questionIndex + 1 < questions.length) {
      setState(() {
        questionIndex++;
      });
    } else {
      setState(() {
        activeScreenName = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreenName = 'start-screen';
      questionIndex = 0;
      chosen = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(switchToQuestions);

    if (activeScreenName == 'questions-screen') {
      activeScreen = QuestionsScreen(chooseAnswer);
    }
    if (activeScreenName == 'results-screen') {
      activeScreen = ResultsScreen(
        restart: restartQuiz,
        chosenPersonalities: chosen,
      );
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 7, 64, 82),
              Color.fromARGB(
                255,
                7,
                64,
                82,
              ), // a lighter green to mimic the vertical gradient in original app
              Color.fromARGB(255, 7, 64, 82),
            ],
          ),
        ),
        child: activeScreen,
      ),
    );
  }
}
