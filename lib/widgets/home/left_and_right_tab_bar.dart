import 'package:flutter/material.dart';
import 'package:re/app_theming/app_colors.dart';

class LeftAndRightTabBar extends StatelessWidget {
  const LeftAndRightTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBar(
        labelPadding: EdgeInsets.symmetric(vertical: 16),
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.mainTextColor,
        ),
        unselectedLabelStyle: Theme.of(context).textTheme.displaySmall,
        indicatorColor: AppColors.selectedTabBarColor,
        dividerColor: Colors.transparent,
        tabs: [Text('Left'), Text('Right')],
      ),
    );
  }
}
