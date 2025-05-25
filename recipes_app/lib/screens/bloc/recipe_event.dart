abstract class RecipeEvent {}

class PickImage extends RecipeEvent {
  final String imagePath;
  PickImage(this.imagePath);
}

class AddRecipe extends RecipeEvent {
  final String title;
  final String description;
  AddRecipe({required this.title, required this.description});
}

class LoadRecipes extends RecipeEvent {}
