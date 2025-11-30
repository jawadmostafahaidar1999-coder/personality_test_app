import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/personality.dart';
import 'package:flutter_application_1/questions_summary/questions_summary.dart';
import 'package:flutter_application_1/widgets/quiz_button.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    required this.restart,
    required this.chosenPersonalities, // list of chosen Personality values per question
    super.key,
  });

  final VoidCallback restart;
  final List<Personality> chosenPersonalities;

  static const Map<Personality, String> messages = {
    Personality.Feeler:
        'You are a Feeler ❤️\nEmpathetic, warm, and guided by emotion.',
    Personality.Thinker:
        'You are a Thinker 🧠\nLogical, curious, and focused on ideas.',
    Personality.Planner:
        'You are a Planner 📋\nOrganized, strategic, and goal-oriented.',
    Personality.Adventurer:
        'You are an Adventurer 🧭\nSpontaneous, bold, and always exploring.',
  };

  List<Map<String, Object>> getSummaryData(List<Personality> chosen) {
    // build a summary where we show question index, question text, correct personality (we'll treat correct as highest scoring one),
    // but simpler: show per-question the personality chosen and the question text.
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosen.length; i++) {
      summary.add({
        'question-index': i,
        'question-text': '', // keep empty: not used here (could fill if needed)
        'correct-personality': chosen[i].toString().split('.').last,
        'chosen-personality': chosen[i].toString().split('.').last,
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // compute overall result
    final Map<Personality, int> scores = {
      Personality.Thinker: 0,
      Personality.Feeler: 0,
      Personality.Planner: 0,
      Personality.Adventurer: 0,
    };
    for (final p in chosenPersonalities) {
      scores[p] = (scores[p] ?? 0) + 1;
    }
    final result = scores.entries
        .reduce((a, b) => a.value >= b.value ? a : b)
        .key;
    final message = messages[result] ?? '';

    // Prepare summary data (optional small summary)
    final summaryData = getSummaryData(chosenPersonalities);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You are a ${result.toString().split('.').last}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 30),
          QuizButton(onTap: restart, icon: Icons.refresh, text: 'Restart Test'),
          const SizedBox(height: 20),
          QuestionsSummary(summaryData),
        ],
      ),
    );
  }
}
