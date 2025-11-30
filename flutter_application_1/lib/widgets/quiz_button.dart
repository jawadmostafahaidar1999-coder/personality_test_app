import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData icon;

  const QuizButton({
    required this.onTap,
    required this.text,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: const Color(0xFF2B5560)),
      label: Text(text, style: const TextStyle(color: Color(0xFF2B5560))),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF1EEF8),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
