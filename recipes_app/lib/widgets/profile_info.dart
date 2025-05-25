import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_color.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.num, required this.info});
  final String num;
  final String info;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '32',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: AppColors.mainText),
        ),
        Text(
          'Recipes',
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(color: AppColors.secondaryText),
        ),
      ],
    );
  }
}
