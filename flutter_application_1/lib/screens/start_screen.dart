import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStart;

  const StartScreen({Key? key, required this.onStart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),

        const Icon(Icons.favorite, size: 60, color: Colors.white),

        const SizedBox(height: 20),

        const Text(
          'Discover Your\nPersonality Type!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Take the short test to find your type',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),

        const Spacer(),

        SizedBox(
          width: 160,
          height: 48,
          child: ElevatedButton(
            onPressed: onStart,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const StadiumBorder(),
              elevation: 4,
            ),
            child: const Text(
              'Start Test',
              style: TextStyle(
                color: Color(0xFF2F5D6A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
