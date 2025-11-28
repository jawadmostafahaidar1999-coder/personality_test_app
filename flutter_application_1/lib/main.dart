import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'models/personality.dart';
import 'screens/start_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

void main() {
  runApp(const PersonalityTestApp());
}

class PersonalityTestApp extends StatefulWidget {
  const PersonalityTestApp({Key? key}) : super(key: key);

  @override
  State<PersonalityTestApp> createState() => _PersonalityTestAppState();
}

class _PersonalityTestAppState extends State<PersonalityTestApp> {
  final Map<Personality, int> _scores = {
    Personality.Thinker: 0,
    Personality.Feeler: 0,
    Personality.Planner: 0,
    Personality.Adventurer: 0,
  };

  int _currentIndex = 0;
  bool _started = false;

  void _startTest() {
    setState(() {
      _started = true;
      _currentIndex = 0;
      _scores.updateAll((key, value) => 0);
    });
  }

  void _answerQuestion(Personality p) {
    setState(() {
      _scores[p] = (_scores[p] ?? 0) + 1;
      _currentIndex++;
    });
  }

  void _restart() {
    setState(() {
      _started = false;
      _currentIndex = 0;
      _scores.updateAll((key, value) => 0);
    });
  }

  Personality _computeResult() {
    Personality result = Personality.Thinker;
    int best = -1;

    _scores.forEach((p, score) {
      if (score > best) {
        best = score;
        result = p;
      }
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          color: const Color(0xFF2F5D6A),
          child: SafeArea(
            child: _started
                ? (_currentIndex < questions.length
                      ? QuestionScreen(
                          question: questions[_currentIndex],
                          onAnswer: _answerQuestion,
                        )
                      : ResultScreen(
                          personality: _computeResult(),
                          onRestart: _restart,
                        ))
                : StartScreen(onStart: _startTest),
          ),
        ),
      ),
    );
  }
}
