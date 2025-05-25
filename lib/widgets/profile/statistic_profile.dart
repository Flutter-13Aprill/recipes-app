import 'package:flutter/material.dart';
import 'package:re/app_theming/app_colors.dart';


class StatisticProfile extends StatelessWidget {
  const StatisticProfile({super.key, required this.statisticNumber,required this.statisticName});

  final String statisticName;
  final String statisticNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Text(statisticNumber,style: Theme.of(context,).textTheme.labelMedium!.copyWith(color: AppColors.mainTextColor),),
        Text(statisticName ,style: Theme.of(context).textTheme.displaySmall),
      ],
    );
  }
}
