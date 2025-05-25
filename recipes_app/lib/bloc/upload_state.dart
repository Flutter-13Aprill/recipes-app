
import 'package:flutter/foundation.dart';
//Used to make the class immutable.
@immutable
abstract class RecipeState {}
//Initial state.
class RecipeInitial extends RecipeState {}

class RecipeLoadSuccessState extends RecipeState {
  final List<Map<String, dynamic>> recipes;

  RecipeLoadSuccessState(this.recipes);
}
