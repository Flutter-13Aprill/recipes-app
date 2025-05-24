import 'package:recipe/model/recipe.dart';

class LikedState {
  final List<Recipe> likedRecipes;

  LikedState({required this.likedRecipes});

  LikedState copyWith({List<Recipe>? likedRecipes}) {
    return LikedState(likedRecipes: likedRecipes ?? this.likedRecipes);
  }
}
