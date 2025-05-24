import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/Theme/app_colors.dart';
import 'package:recipes_app/extensions/screen_size.dart';
import 'package:recipes_app/style/my_style.dart';
import 'package:recipes_app/views/layout/bloc/layout_bloc.dart';
import 'package:recipes_app/widgets/food/display_food.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              minRadius: 80,
              child: Image.asset(
                width: context.getWight(pre: 0.4),
                "assets/images/users/Avatar.png",
              ),
            ),
            StyleApp.sizeH24,
            Text(
              "Choirul Syafril",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            StyleApp.sizeH24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "32",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "782",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "1.287",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Recipes",
                  style: TextStyle(
                    color: AppColors.textHint,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Following",
                  style: TextStyle(
                    color: AppColors.textHint,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Followers",
                  style: TextStyle(
                    color: AppColors.textHint,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

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
                    Container(
                      padding: EdgeInsets.all(16),
                      width: context.getWight(),
                      height: context.getHight(pre: 0.4),
                      child: TabBarView(
                        children: <Widget>[
                          DisplayFood(
                            foods: context.read<LayoutBloc>().myRecipes,
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
        );
      },
    );
  }
}
