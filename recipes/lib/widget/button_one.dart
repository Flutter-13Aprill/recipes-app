import 'package:flutter/material.dart';

class ButtonOne extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonOne({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(360, 55),
        backgroundColor: const Color.fromARGB(255, 73, 128, 75),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
