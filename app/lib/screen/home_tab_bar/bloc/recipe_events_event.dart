 
 import 'package:app/models/recipe.dart';

abstract class RecipeEvent {}
// Event to trigger the loading of recipes.

 class LoadRecipesEvent extends RecipeEvent {}
// Event to toggle the favorite status of a specific recipe.
// It carries the ID of the recipe whose favorite status needs to be changed.

 class ToggleFavoriteEvent extends RecipeEvent {
  final String recipeId;  
  ToggleFavoriteEvent(this.recipeId);  // Constructor for ToggleFavoriteEvent.
}

// Event to add a new recipe to the list.
// It carries the new Recipe object to be added.
class AddRecipeEvent extends RecipeEvent {
  final Recipe newRecipe;
  AddRecipeEvent(this.newRecipe);
}