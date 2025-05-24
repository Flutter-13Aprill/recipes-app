import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/model/recipe.dart';
import 'package:recipe/screens/like/bloc/liked_bloc.dart';
import 'package:recipe/screens/like/bloc/liked_event.dart';
import 'package:recipe/cusom_widget/recipe_ticket.dart';

class RecipesTab extends StatelessWidget {
  const RecipesTab({super.key});

  List<Recipe> get dummyRecipes => [
    Recipe(
      id: '1',
      title: 'Pancake',
      image: 'assets/images/pancake.png',
      author: 'Calum Lewis',
      authorImage: 'assets/images/user1.png',
      category: 'Food',
      duration: '>60 mins',
    ),
    Recipe(
      id: '2',
      title: 'Salad',
      image: 'assets/images/salad.png',
      author: 'Elif Sonas',
      authorImage: 'assets/images/user2.png',
      category: 'Food',
      duration: '>60 mins',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final likedBloc = context.read<LikedBloc>();

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dummyRecipes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (context, index) {
        final recipe = dummyRecipes[index];
        return RecipeTicket(
          recipe: recipe,
          isLiked: false,
          onLikeToggle: () {
            likedBloc.add(ToggleLikeRecipe(recipe));
            DefaultTabController.of(context).animateTo(1);
          },
          showAuthorImage: false,
        );
      },
    );
  }
}
