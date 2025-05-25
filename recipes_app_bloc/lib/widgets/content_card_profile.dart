import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipes_app_bloc/models/recipe_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_bloc.dart';
import 'package:recipes_app_bloc/screens/my_recipes/bloc/my_recipes_event.dart';

Widget recipesCardWidgetProfile({
  required RecipeModel recipe,
}) {
  bool isLiked = recipe.isLiked;

  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        width: (MediaQuery.of(context).size.width - 48) / 2,
        padding: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    File(recipe.imagePath),
                    width: 151,
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
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0x33FFFFFF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              recipe.title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              recipe.description,
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            ),
          ],
        ),
      );
    },
  );
}
