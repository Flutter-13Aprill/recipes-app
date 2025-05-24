// lib/screen/home_tab_bar/bloc/recipe_events_state.dart

import 'package:app/models/recipe.dart';

 abstract class RecipeState {
  const RecipeState();
}

class RecipeInitialState extends RecipeState {}
// Loading state of the Recipe Bloc.

class RecipeLoadingState extends RecipeState {}

// Loaded state of the Recipe Bloc.
// Represents the state when recipes have been successfully loaded.
// It holds the list of all available recipes.
class RecipeLoadedState extends RecipeState {
  final List<Recipe> recipes;
  const RecipeLoadedState(this.recipes);    // Constructor for the loaded state.

}

// Error state of the Recipe Bloc.
// Represents the state when an error occurs during recipe operations (e.g., loading failed).
// It holds an error message to inform the user.

class RecipeErrorState extends RecipeState {
  final String message;
  const RecipeErrorState(this.message);
}