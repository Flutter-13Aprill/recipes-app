import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const WelcomeTextWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  // A simple widget that displays a welcome title and subtitle,
  // typically used on authentication or introduction screens.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 8),

        Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
