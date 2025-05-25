import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_bloc.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_state.dart';
import 'package:recipes_app_bloc/style/color_pallete.dart';
import 'package:recipes_app_bloc/style/font_style.dart';
import 'package:recipes_app_bloc/widgets/content_card.dart';
import 'package:recipes_app_bloc/widgets/content_card_profile.dart';

Widget buildTabBarProfile() {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: [
        TabBar(
          labelStyle: AppTextStyle.fontStyleThirteen,
          unselectedLabelStyle: AppTextStyle.fontStyleTwelve,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 4, color: ColorPallete.green),
            insets: EdgeInsets.symmetric(horizontal: -100),
          ),
          tabs: const [
            Tab(text: 'Recipes'),
            Tab(text: 'Liked'),
          ],
        ),
        Expanded(
          child: TabBarView(
  children: [
    // Recipes Tab (shows all added recipes)
   SingleChildScrollView(
  padding: const EdgeInsets.only(top: 26, left: 32),
  child: BlocBuilder<MyRecipesBloc, MyRecipesState>(
    builder: (context, state) {
      final uploaded = state.recipes.where((r) => r.isUploaded).toList();
      return Wrap(
        spacing: 16,
        runSpacing: 16,
        children: uploaded.map((recipe) {
          return recipesCardWidgetProfile(recipe: recipe);
        }).toList(),
      );
    },
  ),
),

    // Liked Tab
    SingleChildScrollView(
      padding: const EdgeInsets.only(top: 26, left: 32),
      child: BlocBuilder<MyRecipesBloc, MyRecipesState>(
        builder: (context, state) {
          final liked = state.recipes.where((r) => r.isLiked).toList();
          return liked.isEmpty
              ? Center(child: Text('No liked recipes yet'))
              : Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: liked.map((recipe) {
                    return recipesCardWidget(recipe: recipe);
                  }).toList(),
                );
        },
      ),
    ),
  ],
)

          ),
        
      ],
    ),
  );
}
