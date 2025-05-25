import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_colors.dart';
import 'package:recipes_app/utils/extensions/screen/screen_size.dart';

// Defines reusable button styles with different sizes but consistent primary color, adapting to screen dimensions for responsive design.
class AppButtons {
  static ButtonStyle primary(BuildContext context) {
    return ButtonStyle(
      minimumSize: WidgetStatePropertyAll(
        Size(context.getWidth(factor: 0.85), context.getHeight(factor: 0.06)),
      ),
      backgroundColor: WidgetStatePropertyAll(AppColors.buttonColor),
    );
  }

  static ButtonStyle primarySm(BuildContext context) {
    return ButtonStyle(
      minimumSize: WidgetStatePropertyAll(
        Size(context.getWidth(factor: 0.7), context.getHeight(factor: 0.065)),
      ),
      backgroundColor: WidgetStatePropertyAll(AppColors.buttonColor),
    );
  }

  static ButtonStyle primaryXs(BuildContext context) {
    return ButtonStyle(
      minimumSize: WidgetStatePropertyAll(
        Size(context.getWidth(factor: 0.65), context.getHeight(factor: 0.06)),
      ),
      backgroundColor: WidgetStatePropertyAll(AppColors.buttonColor),
    );
  }
}
