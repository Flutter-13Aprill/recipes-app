import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  /// TitleWidget
  ///
  /// Displays a main title [text1] and a subtitle [text2] in a column.
  /// - Styled using the app's text theme.
  const TitleWidget({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text1, style: Theme.of(context).textTheme.headlineLarge),
        // Onboarding subtitle
        Text(text2, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
