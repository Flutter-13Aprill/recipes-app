part of 'recipe_bloc.dart';

@immutable
sealed class RecipeState {}

final class RecipeInitial extends RecipeState {}

class UploadState extends RecipeState {
  final String name;
  final String description;
  final XFile? image;

  UploadState({this.name = '', this.description = '', this.image});
}
