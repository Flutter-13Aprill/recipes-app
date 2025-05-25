import 'package:flutter/material.dart';
import 'package:re/app_theming/app_colors.dart';

class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        labelStyle: Theme.of(
          context,
        ).textTheme.displaySmall!.copyWith(color: Colors.white),
        unselectedLabelStyle: Theme.of(context).textTheme.displaySmall,
        unselectedLabelColor: AppColors.unselectedTabBarColor,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: AppColors.selectedTabBarColor,
        ),
        tabs: [Tab(text: 'All'), Tab(text: 'Food'), Tab(text: 'Drink')],
      ),
    );
  }
}
