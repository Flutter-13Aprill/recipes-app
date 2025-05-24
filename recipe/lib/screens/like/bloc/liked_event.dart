import 'package:recipe/model/recipe.dart';

abstract class LikedEvent {}

class ToggleLikeRecipe extends LikedEvent {
  final Recipe recipe;

  ToggleLikeRecipe(this.recipe);
}
