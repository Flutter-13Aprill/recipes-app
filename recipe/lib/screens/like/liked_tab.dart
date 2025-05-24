import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/screens/like/bloc/liked_bloc.dart';
import 'package:recipe/screens/like/bloc/liked_event.dart';
import 'package:recipe/screens/like/bloc/liked_state.dart';
import 'package:recipe/cusom_widget/recipe_ticket.dart';

class LikedTab extends StatelessWidget {
  const LikedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedBloc, LikedState>(
      builder: (context, state) {
        if (state.likedRecipes.isEmpty) {
          return const Center(child: Text("No liked recipes yet."));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.68,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: state.likedRecipes.length,
          itemBuilder: (context, index) {
            final recipe = state.likedRecipes[index];
            return RecipeTicket(
              recipe: recipe,
              isLiked: true,
              onLikeToggle: () {
                context.read<LikedBloc>().add(ToggleLikeRecipe(recipe));
              },
              showAuthorImage: false,
            );
          },
        );
      },
    );
  }
}
