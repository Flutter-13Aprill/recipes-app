// ✅ FINAL HomeScreen using BLoC (with Left tab recipes that can be liked)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app_bloc/models/recipe_model.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_bloc.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_event.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_state.dart';
import 'package:recipes_app_bloc/style/color_pallete.dart';
import 'package:recipes_app_bloc/style/font_style.dart';
import 'package:recipes_app_bloc/widgets/chip.dart';
import 'package:recipes_app_bloc/widgets/content_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool recipesAdded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!recipesAdded) {
      final staticRecipes = [
        RecipeModel(
          profileImage: 'lib/assets/images/friend3.png',
          name: 'Calum Lewis',
          imagePath: 'lib/assets/images/pancake_square.png',
          title: 'Pancake',
          description: 'Food • >60 mins',
        ),
        RecipeModel(
          profileImage: 'lib/assets/images/friens4.png',
          name: 'Elena Shelby',
          imagePath: 'lib/assets/images/food4_s.png',
          title: 'Pancake',
          description: 'Food • >60 mins',
        ),
        RecipeModel(
          profileImage: 'lib/assets/images/friend2.png',
          name: 'John Priyadi',
          imagePath: 'lib/assets/images/food_s.png',
          title: 'Salad',
          description: 'Food • 45 mins',
        ),
      ];
      final bloc = context.read<MyRecipesBloc>();
      for (final recipe in staticRecipes) {
        bloc.add(AddRecipe(recipe));
      }
      recipesAdded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            SizedBox(
              width: 360,
              height: 90,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: ColorPallete.grey,
                  prefixIcon: Image.asset("lib/assets/images/search.png"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 45),
                Text("Category", style: AppTextStyle.fontStyleEight),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                const SizedBox(width: 48),
                buildChip(label: "All", color: ColorPallete.green),
                buildChip(label: "Food", color: ColorPallete.grey),
                buildChip(label: "Drink", color: ColorPallete.grey),
              ],
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Container(
                  width: 428,
                  height: 8,
                  color: ColorPallete.grey,
                ),
              ],
            ),
            const SizedBox(height: 22),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: AppTextStyle.fontStyleThirteen,
                      unselectedLabelStyle: AppTextStyle.fontStyleTwelve,
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(width: 4, color: ColorPallete.green),
                        insets: EdgeInsets.symmetric(horizontal: -100),
                      ),
                      tabs: const [
                        Tab(text: 'Left'),
                        Tab(text: 'Right'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // LEFT TAB: shows cards from BLoC
                          SingleChildScrollView(
                            padding: const EdgeInsets.only(top: 26, left: 32),
                            child: BlocBuilder<MyRecipesBloc, MyRecipesState>(
                              builder: (context, state) {
                                return Wrap(
                                  spacing: 16,
                                  runSpacing: 16,
                                  children: state.recipes.map((recipe) {
                                    return recipesCardWidget(recipe: recipe);
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                          const Center(
                            child: Text('No content yet'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
