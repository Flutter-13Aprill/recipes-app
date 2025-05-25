import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_color.dart';

class CheckValidationWidget extends StatelessWidget {
  const CheckValidationWidget({super.key, required this.lable, required this.icon});
  final String lable;
  final Icon icon;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        SizedBox(width: 8),
        Text(
          lable,
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(color: AppColors.secondaryText),
        ),
      ],
    );
  }
}
