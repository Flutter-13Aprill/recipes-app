import 'package:flutter/material.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:project5/extensions/theme_text.dart';

class ChekcBoxSignup extends StatelessWidget {
  const ChekcBoxSignup({super.key, required this.isCorrect, required this.setText});
  final bool isCorrect;
  final String setText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth() * 0.7,
      child: Row(
        spacing: 16,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isCorrect
                      ? Color.fromARGB(255, 227, 255, 241)
                      : const Color.fromARGB(255,232, 232, 248),
            ),
            child: Icon(
              Icons.check,
              size: 20,
              color:
                  isCorrect
                      ? Color.fromARGB(255, 31, 204, 121)
                      : const Color.fromARGB(255, 159, 165, 192),
            ),
          ),
          Text(
            setText,
            style: context.bodyM()!.copyWith(
              color:
                  isCorrect
                      ? Color.fromARGB(255, 46, 62, 92)
                      : const Color.fromARGB(255, 159, 165, 192),
            ),
          ),
        ],
      ),
    );
  }
}
