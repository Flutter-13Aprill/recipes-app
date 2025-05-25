import 'package:flutter/material.dart';
import 'package:recpie_app/theme/colors_app.dart';

class SecondaryText extends StatelessWidget {
  final String text;
  final int fontSize;

  const SecondaryText({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 17, color: ColorsApp.secondryText),
    );
  }
}
