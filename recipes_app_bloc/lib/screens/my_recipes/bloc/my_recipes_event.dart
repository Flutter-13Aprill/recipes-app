import 'package:recipes_app_bloc/models/recipe_model.dart';

abstract class MyRecipesEvent {}

class AddRecipe extends MyRecipesEvent {
  final RecipeModel recipe;
  AddRecipe(this.recipe);
}
class ToggleLikeRecipe extends MyRecipesEvent {
  final RecipeModel recipe;
  ToggleLikeRecipe(this.recipe);
}


