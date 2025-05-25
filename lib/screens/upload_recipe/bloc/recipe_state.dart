part of 'recipe_bloc.dart';

@immutable
sealed class RecipeState {}

final class RecipeInitial extends RecipeState {}

final class SuccessSliderChange extends RecipeState{
  final double? sliderValue;

  SuccessSliderChange({this.sliderValue});
}

final class SuccessAddedRecipeState extends RecipeState{
  final List<RecipeModel> recipes; 

  SuccessAddedRecipeState({required this.recipes});
}
