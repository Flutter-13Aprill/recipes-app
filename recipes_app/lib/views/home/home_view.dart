import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/Theme/app_colors.dart';
import 'package:recipes_app/extensions/screen_size.dart';
import 'package:recipes_app/models/category_model.dart';
import 'package:recipes_app/style/my_style.dart';
import 'package:recipes_app/views/layout/bloc/layout_bloc.dart';
import 'package:recipes_app/widgets/food/display_food.dart';
import 'package:recipes_app/widgets/search/search_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyleApp.sizeH16,
                  SearchWidget(),
                  StyleApp.sizeH24,
                  Text(
                    "Category",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  StyleApp.sizeH16,
                  Row(
                    children: [
                      SizedBox(
                        width: context.getWight(pre: 0.90),
                        height: context.getHight(pre: 0.05),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 2, right: 16),
                              height: context.getHight(pre: 0.05),
                              width: context.getWight(pre: 0.16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: categories[index].isSelected
                                    ? AppColors.success
                                    : AppColors.border,
                              ),

                              child: Text(
                                categories[index].name,
                                style: TextStyle(
                                  color: categories[index].isSelected
                                      ? AppColors.surface
                                      : AppColors.textSecondary,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 40, thickness: 8, color: AppColors.border),
                  SizedBox(
                    height: context.getHight(pre: 0.5),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                width: 3,
                                color: AppColors.success,
                              ),
                              insets: EdgeInsets.zero,
                            ),
                            tabs: [
                              Tab(text: 'Recipes'),
                              Tab(text: 'Liked'),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: <Widget>[
                                DisplayFood(
                                  foods: context.read<LayoutBloc>().foods,
                                ),
                                DisplayFood(
                                  foods: context.read<LayoutBloc>().favoriteFoods,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
