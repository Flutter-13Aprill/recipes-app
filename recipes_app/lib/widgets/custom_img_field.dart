import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_color.dart';

class CustomImgField extends StatelessWidget {
  const CustomImgField({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        dashPattern: [10, 7],
        strokeWidth: 2,
        radius: Radius.circular(12),
        color: AppColors.outline,
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/Image.png'),
            Text(
              'Add Cover Photo',
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(color: AppColors.mainText),
            ),
            Text(
              '(up to 12 Mb)',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
