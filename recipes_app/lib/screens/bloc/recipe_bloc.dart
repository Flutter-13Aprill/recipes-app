import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/screens/bloc/recipe_event.dart';
import 'package:recipes_app/screens/bloc/recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeState.initial()) {
    on<PickImage>((event, emit) {
      emit(state.copyWith(selectedImagePath: event.imagePath));
    });

    on<AddRecipe>((event, emit) {
      if (state.selectedImagePath != null) {
        final newRecipe = Recipe(
          title: event.title,
          description: event.description,
          imagePath: state.selectedImagePath!,
        );
        final updatedRecipes = List<Recipe>.from(state.recipes)..add(newRecipe);
        emit(RecipeState(recipes: updatedRecipes, selectedImagePath: null));
      }
    });

    on<LoadRecipes>((event, emit) {
      emit(state); 
    });
  }
}
