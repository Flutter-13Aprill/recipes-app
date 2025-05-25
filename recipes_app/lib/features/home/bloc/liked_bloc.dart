import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipes_app/features/home/models/recipe_data.dart';

part 'liked_event.dart';
part 'liked_state.dart';

/// LikedBloc
///
/// Manages the state of liked recipes using the BLoC pattern.
///
/// - Holds a list of liked [RecipeData].
/// - Handles two events:
///   - [LikeRecipeEvent]: Adds a recipe to the liked list if not already liked.
///   - [UnlikeRecipeEvent]: Removes a recipe from the liked list.
/// - Emits [LikeLoaded] state with the updated list of liked recipes.
class LikedBloc extends Bloc<LikedEvent, LikedState> {
  final List<RecipeData> likedRecipes = [];

  LikedBloc() : super(LikedInitial()) {
    on<LikedEvent>((event, emit) {
      on<LikeRecipeEvent>(addLikedRecipeMethod);
      on<UnlikeRecipeEvent>(removeLikedRecipeMethod);
    });
  }

  FutureOr<void> addLikedRecipeMethod(
    LikeRecipeEvent event,
    Emitter<LikedState> emit,
  ) {
    if (!likedRecipes.contains(event.recipe)) {
      likedRecipes.add(event.recipe);
      emit(LikeLoaded(likedRecipes));
    }
  }

  FutureOr<void> removeLikedRecipeMethod(
    UnlikeRecipeEvent event,
    Emitter<LikedState> emit,
  ) {
    likedRecipes.remove(event.recipe);
    emit(LikeLoaded(likedRecipes));
  }
}
