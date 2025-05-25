import 'package:blocrecipes/Styles/colors.dart';
import 'package:flutter/material.dart';

class Stat extends StatelessWidget {
  final String label;

  final int value;

  const Stat({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: secondaryText,
          ),
        ),
        Text(label, style: TextStyle(color: secondaryText, fontSize: 13)),
      ],
    );
  }
}
