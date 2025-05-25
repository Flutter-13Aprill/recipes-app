import 'package:flutter/material.dart';
import 'package:re/app_theming/app_colors.dart';


class TabBarChip extends StatelessWidget {
  const TabBarChip({super.key,required this.label,required this.index, required this.tabBarIndex});

  final String label;
  final int index;
  final int tabBarIndex;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: index == tabBarIndex ? AppColors.selectedTabBarColor : AppColors.unselectedTabBarColor,
        borderRadius: BorderRadius.circular(32)
      ),
    child: Text(label, style: Theme.of(context).textTheme.displaySmall!.copyWith(
      color: index == tabBarIndex ? AppColors.selectedTabBarTextColor : AppColors.unselectedTabBarTextColor
    ),),
    );
  }
}