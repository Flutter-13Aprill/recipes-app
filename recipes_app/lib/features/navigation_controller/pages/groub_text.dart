import 'package:flutter/material.dart';

class GroubText extends StatelessWidget {
  const GroubText({super.key, required this.label, required this.number});
final String label;
final double number;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(number.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
