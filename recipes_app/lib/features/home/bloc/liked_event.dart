part of 'liked_bloc.dart';

@immutable
sealed class LikedEvent {}

class LikeRecipeEvent extends LikedEvent {
  final RecipeData recipe;
  LikeRecipeEvent(this.recipe);
}

class UnlikeRecipeEvent extends LikedEvent {
  final RecipeData recipe;
  UnlikeRecipeEvent(this.recipe);
}
