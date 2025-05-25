import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_color.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.iconImg,
    required this.name,
    required this.img,
    required this.time,
    required this.title,
    required this.icon,
  });
  final String iconImg;
  final String name;
  final String img;
  final String title;
  final String time;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.42,
      height: 320,
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(iconImg),
              SizedBox(width: 8),
              Text(
                name,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.mainText),
              ),
            ],
          ),
          // Image.asset('assets/item1.png'),
          Stack(
            children: [
              Image.asset(img),
              Positioned(
                top: 20,
                right: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(54, 255, 255, 255),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: icon,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(color: AppColors.mainText),
          ),
          Row(
            children: [
              Text(
                'Food',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              Text(
                ' • ',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              Text(
                '>$time mins',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
