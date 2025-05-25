part of 'add_recipe_bloc.dart';

abstract class AddRecipeEvent {}

class AddRecipePressed extends AddRecipeEvent {
  final String personname;
  final dynamic image;
  final String title;
  final String description;
  final int duration;

  AddRecipePressed({
    required this.personname,
    required this.image,
    required this.title,
    required this.description,
    required this.duration,
  });
}

class ToggleFavoritePressed extends AddRecipeEvent {
  final int index;
  ToggleFavoritePressed(this.index);
}

class ChangeCategory extends AddRecipeEvent {
  final String category;
  ChangeCategory(this.category);
}

class UpdateSearchQuery extends AddRecipeEvent {
  final String searchtext;
  UpdateSearchQuery(this.searchtext);
}
