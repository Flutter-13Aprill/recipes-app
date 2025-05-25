import 'package:flutter/material.dart';

class ButtomText extends StatelessWidget {
  /// ButtomText
  ///
  /// A reusable text button widget.
  /// - Takes a required [text] and an optional [onPressed] callback.
  const ButtomText({super.key, this.onPressed, required this.text});
  final Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
