import 'package:flutter/material.dart';

class SignupCritriaWidget extends StatelessWidget {
  final String text;
  final bool met;

  const SignupCritriaWidget({
    super.key,
    required this.text,
    required this.met,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = met ? const Color(0xFF3FD28B) : const Color(0xFF9A9DB0);
    const textColor = Color(0xFF9A9DB0);

    return Row(
      children: [
        Icon(Icons.check_circle, size: 18, color: iconColor),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14, color: textColor)),
      ],
    );
  }
}
