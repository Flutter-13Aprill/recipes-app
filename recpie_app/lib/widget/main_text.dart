import 'package:flutter/material.dart';
import 'package:recpie_app/theme/colors_app.dart';

class MainText extends StatelessWidget {
  final String text;

  const MainText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: ColorsApp.mainText,
      ),
    );
  }
}
