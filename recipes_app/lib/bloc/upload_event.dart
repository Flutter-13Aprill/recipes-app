import 'dart:io';
import 'package:flutter/foundation.dart';

@immutable
abstract class RecipeEvent {}

class AddRecipeEvent extends RecipeEvent {
  final String id;
  final String name;
  final String description;
  final int duration;
  final File image;

  AddRecipeEvent({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.image,
  });
}

class ToggleLikeRecipeEvent extends RecipeEvent {
  final String id;

  ToggleLikeRecipeEvent(this.id);
}

class ShowAllRecipesEvent extends RecipeEvent {}

class ShowLikedRecipesEvent extends RecipeEvent {}
