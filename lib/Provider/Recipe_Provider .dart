import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/Models/Recipe_Model.dart';

class RecipeProvider with ChangeNotifier {
  final List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;
  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }
}
