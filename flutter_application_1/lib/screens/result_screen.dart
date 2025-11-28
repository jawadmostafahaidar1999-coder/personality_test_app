import 'package:flutter/material.dart';
import '../models/personality.dart';
import '../utils/personality_messages.dart';

class ResultScreen extends StatelessWidget {
  final Personality personality;
  final VoidCallback onRestart;

  const ResultScreen({
    Key? key,
    required this.personality,
    required this.onRestart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = personalityMessages[personality] ?? '';
    final label = personality.toString().split('.').last;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'You are an',
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),

        const SizedBox(height: 10),

        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF3A6B77),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),

        const SizedBox(height: 30),

        SizedBox(
          width: 160,
          height: 48,
          child: ElevatedButton(
            onPressed: onRestart,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const StadiumBorder(),
            ),
            child: const Text(
              'Restart Test',
              style: TextStyle(
                color: Color(0xFF2F5D6A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
