import 'package:recipes_app/models/recipe.dart';

class RecipeState {
  final List<Recipe> recipes;
  final String? selectedImagePath;

  RecipeState({
    required this.recipes,
    this.selectedImagePath,
  });

  static initial() {}

  RecipeState copyWith({required String selectedImagePath}) {
    return RecipeState(
      recipes: recipes,
      selectedImagePath: selectedImagePath,
    );
  }

  

}
