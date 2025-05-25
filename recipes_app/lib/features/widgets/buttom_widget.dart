import 'package:flutter/material.dart';
import 'package:recipes_app/extensions/screens/get_size_screen.dart';
import 'package:recipes_app/style/style_color.dart';

class ButtomWidget extends StatelessWidget {
  /// A custom elevated button widget
  const ButtomWidget({
    super.key,
    required this.onTab,
    required this.textElevatedButton,
  });

  /// Callback for button press
  final Function()? onTab;

  /// Button label
  final String textElevatedButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(StyleColor.primary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(context.getWidth() + 200, context.getHeight() / 16),
        ),
      ),
      onPressed: onTab,
      child: Center(
        child: Text(
          textElevatedButton,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
