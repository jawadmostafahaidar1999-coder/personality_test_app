import 'package:flutter/material.dart';
import 'package:flutter_application_1/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((s) => SummaryItem(s)).toList(),
        ),
      ),
    );
  }
}
