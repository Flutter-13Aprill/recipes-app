// --- Custom Card Widget ---
import 'package:blocrecipes/Helper/screen_extension.dart';
import 'package:blocrecipes/Models/recipe.dart';
import 'package:blocrecipes/Repo/data.dart';
import 'package:blocrecipes/Screens/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const ProfileRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        var bloc = context.read<ProfileBloc>();

        return Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child:
                        recipe.isFromFile
                            ? Image(
                              image: recipe.foodImage!,
                              height: context.screenHeight * 0.2,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                            : Image.asset(
                              recipe.foodImagePath!,
                              height: context.screenHeight * 0.2,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: GestureDetector(
                      onTap: () {
                        recipe.isLiked = !recipe.isLiked;
                        if (recipe.isLiked) {
                          liked.add(recipe);
                        } else {
                          liked.remove(recipe);
                        }
                        bloc.add(LikeRecipe());
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Icon(
                          Icons.favorite,
                          color: recipe.isLiked ? Colors.red : Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  recipe.foodName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  recipe.duration,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
