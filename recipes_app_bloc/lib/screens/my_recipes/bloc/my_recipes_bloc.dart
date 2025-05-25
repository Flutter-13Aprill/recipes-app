import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app_bloc/models/recipe_model.dart';
import 'my_recipes_event.dart';
import 'my_recipes_state.dart';

class MyRecipesBloc extends Bloc<MyRecipesEvent, MyRecipesState> {
  MyRecipesBloc() : super(MyRecipesState()) {
    on<AddRecipe>((event, emit) {
      final updatedList = List<RecipeModel>.from(state.recipes)
        ..add(event.recipe);
      emit(MyRecipesState(recipes: updatedList));
    });
on<ToggleLikeRecipe>((event, emit) {
  final updatedRecipes = state.recipes.map((r) {
    if (r == event.recipe) {
      return r.copyWith(isLiked: !r.isLiked);
    }
    return r;
  }).toList();
  emit(MyRecipesState(recipes: updatedRecipes));
});




  }
}
