import 'package:flutter/material.dart';
import 'package:re/app_theming/app_colors.dart';


class RecipeInputField extends StatelessWidget {
  const RecipeInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.isDescription
  });

  final TextEditingController controller;
  final String labelText;
  final bool isDescription;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorHeight: 12,
      maxLines: isDescription ? 4 : 1,
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: Theme.of(context).textTheme.displaySmall,
        contentPadding: isDescription ?  EdgeInsets.all(20) : EdgeInsets.symmetric(horizontal: 24),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.outlineColor, width: 2),
          borderRadius: BorderRadius.circular(isDescription ? 8 : 32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.outlineColor, width: 2),
          borderRadius: BorderRadius.circular(isDescription ? 8 : 32),
        ),
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
    );
  }
}
