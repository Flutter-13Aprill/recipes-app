part of 'recipe_bloc.dart';

@immutable
sealed class RecipeEvent {}

final class SliderChangeEvent extends RecipeEvent{
  final double sliderValue;

  SliderChangeEvent({required this.sliderValue});
}

final class AddRecipeEvent extends RecipeEvent{
  final RecipeModel recipeModel; 

  AddRecipeEvent({required this.recipeModel});
}

final class AddPhotoEvent extends RecipeEvent{
  final File image; 

  AddPhotoEvent({required this.image});
}