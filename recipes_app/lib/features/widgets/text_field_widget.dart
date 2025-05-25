import 'package:flutter/material.dart';
import 'package:recipes_app/style/style_color.dart';

class TextFieldWidget extends StatelessWidget {
  /// A reusable text field widget with label, hint, and validation.
  const TextFieldWidget({
    super.key,

    this.validate,
    required this.controller,
    required this.textHint,
    this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String textHint;

  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        hintText: textHint,
        prefixIcon: Icon(prefixIcon, color: StyleColor.secondaryText),
        suffixIcon: Icon(suffixIcon, color: StyleColor.secondaryText),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(32),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(32),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      validator: validate,
    );
  }
}
