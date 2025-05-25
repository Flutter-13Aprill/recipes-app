import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_color.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key, required this.tab1, required this.tab2});
  final String tab1;
  final String tab2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: AppColors.primary,
        indicatorWeight: 4,
        indicator: BoxDecoration(),
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.secondaryText,
        tabs: [
          Tab(child: Text(tab1, style: TextStyle(fontWeight: FontWeight.bold))),
          Tab(child: Text(tab2, style: TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
