import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_color.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key, required this.lable, required this.width,});
  final String lable;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width * width,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            lable,
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(color: AppColors.white),
          ),
        ),
    );
  }
}
