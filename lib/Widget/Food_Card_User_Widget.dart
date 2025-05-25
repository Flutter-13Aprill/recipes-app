import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipes_app/Models/Recipe_Model.dart';
import 'package:flutter_recipes_app/Screen/bloc/recipe_like_cubit.dart';

class FoodCardUserWidget extends StatelessWidget {
  final Recipe recipe;
  const FoodCardUserWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final isLiked = recipe.isLiked;

    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Image.file(
                  File(recipe.imagePath),
                  width: double.infinity,
                  height: 151,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () {
                      context.read<RecipeLikeCubit>().toggleLike(recipe);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xFF3E5481),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Food • >60 mins",
                  style: TextStyle(color: Color(0xFF9FA5C0), fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
