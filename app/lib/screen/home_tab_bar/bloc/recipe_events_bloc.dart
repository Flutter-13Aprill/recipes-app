import 'package:app/screen/home_tab_bar/bloc/recipe_events_event.dart';
import 'package:app/screen/home_tab_bar/bloc/recipe_events_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'package:app/models/recipe.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final math.Random _random =
      math.Random(); // Random number generator for unique IDs.
  List<Recipe> _allRecipes =
      []; // Private list to hold all recipes (the single source of truth).

  RecipeBloc() : super(RecipeInitialState()) {
    // Register event handlers.
    on<LoadRecipesEvent>(_onLoadRecipes); // Handles loading recipes.
    on<ToggleFavoriteEvent>(
      _onToggleFavorite,
    ); // Handles toggling a recipe's favorite status.
    on<AddRecipeEvent>((event, emit) {
      // Handles adding a new recipe.
      _allRecipes.add(event.newRecipe);
      emit(RecipeLoadedState(List.from(_allRecipes))); //update UI
    });
  }

  Future<void> _onLoadRecipes(
    LoadRecipesEvent event,
    Emitter<RecipeState> emit,
  ) async {
    // Emit a loading state initially. This shows a progress indicator while data is being fetched.
    emit(RecipeLoadingState());
    // Simulate a network/database delay for fetching data.
    // This line causes a 1-second delay before recipes are displayed.
    await Future.delayed(const Duration(seconds: 1));
    if (_allRecipes.isEmpty) {
      // Check if _allRecipes is empty.
      _allRecipes = [
        // If the list is empty, populate it with static/initial recipe data.
        Recipe(
          id: _random.nextInt(1000000).toString(),
          name: "Calum Lewis",
          profileImagePath: "assets/images/12.png",
          recipeImage: "assets/images/7.png",
          title: "Pancake",
          isFavorite: false,
        ),
        Recipe(
          id: _random.nextInt(1000000).toString(),
          name: "Eilif Sonas",
          profileImagePath: "assets/images/13.png",
          recipeImage: "assets/images/2.png",
          title: "Salad",
          isFavorite: false,
        ),
        Recipe(
          id: _random.nextInt(1000000).toString(),
          name: "Elena Shelby",
          profileImagePath: "assets/images/14.png",
          recipeImage: "assets/images/1.png",
          title: "Pancake",
          isFavorite: false,
        ),
        Recipe(
          id: _random.nextInt(1000000).toString(),
          name: "John Priyadi",
          profileImagePath: "assets/images/15.png",
          recipeImage: "assets/images/5.png",
          title: "Salad",
          isFavorite: false,
        ),
      ];
    }
    // Emit a new RecipeLoadedState with a new copy of the recipe list.
    // This makes sure that UI components listening to this state will rebuild with the updated data.
    emit(RecipeLoadedState(List.from(_allRecipes)));
  }

  Future<void> _onToggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<RecipeState> emit,
  ) async {
    // Find the index of the recipe to be toggled based on its ID.
    final recipeIndex = _allRecipes.indexWhere(
      (item) => item.id == event.recipeId,
    );
    // If the recipe is found.

    if (recipeIndex != -1) {
      // Create a new Recipe instance with the toggled favorite status using copyWith.

      final updatedRecipe = _allRecipes[recipeIndex].copyWith(
        isFavorite: !_allRecipes[recipeIndex].isFavorite,
      );
      _allRecipes[recipeIndex] =
          updatedRecipe; // Update the recipe in the internal list.

      // Emit a new RecipeLoadedState with a new copy of the updated recipe list.
      // This ensures that the UI rebuilds to reflect the favorite status change.
      emit(RecipeLoadedState(List.from(_allRecipes)));
    }
  }
}
