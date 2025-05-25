import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app_bloc/models/recipe_model.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_bloc.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_event.dart';

Widget recipesCardWidget({
  required RecipeModel recipe,
}) {
  return Builder(
    builder: (context) {
      final bool isLiked = recipe.isLiked;

      return Container(
        width: (MediaQuery.of(context).size.width - 64) / 2, // 2 per row with padding
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile row
            if (recipe.profileImage != null && recipe.name != null)
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: Image.asset(
                      recipe.profileImage!,
                      width: 31,
                      height: 31,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      recipe.name!,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 10),

            // Image and like icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    recipe.imagePath,
                    width: double.infinity,
                    height: 151,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      context.read<MyRecipesBloc>().add(ToggleLikeRecipe(recipe));
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0x33FFFFFF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        recipe.isLiked
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Title & description
            Text(
              recipe.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              recipe.description,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      );
    },
  );
}


