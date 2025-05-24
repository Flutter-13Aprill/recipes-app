import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/model/recipe.dart';
import 'liked_event.dart';
import 'liked_state.dart';

class LikedBloc extends Bloc<LikedEvent, LikedState> {
  LikedBloc() : super(LikedState(likedRecipes: [])) {
    on<ToggleLikeRecipe>((event, emit) {
      final current = List<Recipe>.from(state.likedRecipes);
      if (current.contains(event.recipe)) {
        current.remove(event.recipe);
      } else {
        current.add(event.recipe);
      }
      emit(state.copyWith(likedRecipes: current));
    });
  }
}
