part of 'liked_bloc.dart';

@immutable
sealed class LikedState {}

final class LikedInitial extends LikedState {}

class LikeLoaded extends LikedState {
  final List<RecipeData> recipes;

  LikeLoaded(this.recipes);
}
