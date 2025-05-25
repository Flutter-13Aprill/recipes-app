import 'package:recipes_app_bloc/models/recipe_model.dart';

class MyRecipesState {
  final List<RecipeModel> recipes;
  MyRecipesState({this.recipes = const []});
}
