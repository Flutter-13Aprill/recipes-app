import 'package:flutter/material.dart';
import 'package:re/app_theming/app_colors.dart';
import 'package:re/utilities/screens/screen_sizes.dart';
import 'package:re/widgets/app_custom_button.dart';
import 'package:re/widgets/profile/statistic_profile.dart';

class ProfileStatistics extends StatelessWidget {
  const ProfileStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.getHeight(multiplied: 0.02)),

        Image.asset('assets/profile/Avatar.png'),

        SizedBox(height: context.getHeight(multiplied: 0.02)),

        Text('Choirul Syafril', style: Theme.of(context).textTheme.titleLarge),

        Container(
          margin: EdgeInsets.only(top: 30, right: 24, left: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatisticProfile(statisticNumber: '32', statisticName: 'Recipes'),
              StatisticProfile(
                statisticNumber: '782',
                statisticName: 'Following',
              ),
              StatisticProfile(
                statisticNumber: '1287',
                statisticName: 'Followers',
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 56, right: 56, top: 32),
          child: AppCustomButton(label: 'Follow', onPressed: () {}),
        ),

        SizedBox(height: context.getHeight(multiplied: 0.024)),

        Divider(color: AppColors.dividerColor, thickness: 4),

        SizedBox(height: context.getHeight(multiplied: 0.024)),
      ],
    );
  }
}
