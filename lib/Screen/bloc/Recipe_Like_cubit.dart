// lib/Screen/bloc/recipe_like_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_recipes_app/Models/Recipe_Model.dart';

class RecipeLikeCubit extends Cubit<List<Recipe>> {
  RecipeLikeCubit(this.allRecipes) : super(List.from(allRecipes));

  final List<Recipe> allRecipes;

  void toggleLike(Recipe recipe) {
    // Find the index and update the specific item
    final index = allRecipes.indexOf(recipe);
    if (index != -1) {
      allRecipes[index].isLiked = !allRecipes[index].isLiked;
      emit(List.from(allRecipes)); 
    }
  }

  List<Recipe> get likedRecipes =>
      state.where((recipe) => recipe.isLiked).toList();
}
