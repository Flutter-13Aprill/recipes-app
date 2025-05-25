import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipes_app/Provider/Recipe_Provider%20.dart';
import 'package:flutter_recipes_app/Screen/bloc/Profile_tab_bloc.dart';
import 'package:flutter_recipes_app/Screen/bloc/recipe_like_cubit.dart';
import 'package:flutter_recipes_app/Widget/Food_Card_User_Widget.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatelessWidget {
  final String profileImage;
  final String name;
  final int following;
  final int followers;

  const MyProfileScreen({
    super.key,
    required this.profileImage,
    required this.name,
    required this.following,
    required this.followers,
  });
  @override
  Widget build(BuildContext context) {
  
    final initialRecipes = Provider.of<RecipeProvider>(context, listen: false).recipes;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RecipeLikeCubit(initialRecipes)),
        BlocProvider(create: (_) => ProfileTabCubit()),
      ],
      child: Builder(
        builder: (context) {
          final tab = context.watch<ProfileTabCubit>().state;
          final recipes = context.watch<RecipeLikeCubit>().state;
          final likedRecipes = recipes.where((r) => r.isLiked).toList();
          final items = tab == ProfileTab.recipes ? recipes : likedRecipes;

          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.share, size: 20),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Share tapped!")),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3E5481),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStat("Recipes", recipes.length),
                      _buildStat("Following", following),
                      _buildStat("Followers", followers),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    height: 8,
                    color: const Color(0xFFF4F5F7),
                  ),
                  const SizedBox(height: 24),
                  _buildTabBar(context),
                  const SizedBox(height: 24),
                  Expanded(
                    child: items.isEmpty
                        ? const Center(child: Text('No recipes yet.'))
                        : GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            itemCount: items.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.8,
                            ),
                            itemBuilder: (context, index) {
                              final recipe = items[index];
                              return FoodCardUserWidget(recipe: recipe);
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStat(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Color(0xFF3E5481),
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Color(0xFF9FA5C0), fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    final currentTab = context.watch<ProfileTabCubit>().state;

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => context.read<ProfileTabCubit>().showRecipes(),
            child: Column(
              children: [
                Text(
                  "Recipes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: currentTab == ProfileTab.recipes
                        ? const Color(0xFF3E5481)
                        : const Color(0xFF9FA5C0),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                Divider(
                  thickness: currentTab == ProfileTab.recipes ? 3 : 1,
                  color: currentTab == ProfileTab.recipes
                      ? const Color(0xFF34C47C)
                      : Colors.grey,
                  height: 0,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => context.read<ProfileTabCubit>().showLiked(),
            child: Column(
              children: [
                Text(
                  "Liked",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: currentTab == ProfileTab.liked
                        ? const Color(0xFF3E5481)
                        : const Color(0xFF9FA5C0),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                Divider(
                  thickness: currentTab == ProfileTab.liked ? 3 : 1,
                  color: currentTab == ProfileTab.liked
                      ? const Color(0xFF34C47C)
                      : Colors.grey,
                  height: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
