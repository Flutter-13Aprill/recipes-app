import 'package:flutter/material.dart';
import 'package:re/app_theming/app_colors.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Cancel',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: AppColors.cancelationTextColor,
            fontWeight: FontWeight.w700,
          ),
        ),

        Text('1/2', style: Theme.of(context).textTheme.displaySmall),
      ],
    );
  }
}
