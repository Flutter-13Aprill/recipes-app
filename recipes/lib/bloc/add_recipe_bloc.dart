// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recipes/data/initialrecipes.dart';
// import 'add_recipe_event.dart';
// import 'add_recipe_state.dart';

// // import '../data/initial_recipes.dart';
// class AddRecipeBloc extends Bloc<AddRecipeEvent, AddRecipeState> {
//   AddRecipeBloc() : super(AddRecipeState(recipes: initialRecipes)) {
//     {
//       on<AddRecipePressed>((event, emit) {
//         final updated = List<Recipe>.from(state.recipes)..add(
//           Recipe(
//             personname: event.personname,
//             imageavtar: event.image,
//             image: event.image,
//             title: event.title,
//             description: event.description,
//             duration: event.duration,
//           ),
//         );
//         emit(state.copyWith(recipes: updated));
//       });

//       on<ToggleFavoritePressed>((event, emit) {
//         final updated = List<Recipe>.from(state.recipes);
//         updated[event.index].isFavorite = !updated[event.index].isFavorite;
//         emit(state.copyWith(recipes: updated));
//       });

//       on<ChangeCategory>((event, emit) {
//         emit(state.copyWith(selectedCategory: event.category));
//       });

//       on<UpdateSearchQuery>(updatesearch);
//     }
//   }

//   FutureOr<void> updatesearch(
//     UpdateSearchQuery event,
//     Emitter<AddRecipeState> emit,
//   ) {
//     emit(state.copyWith(searchQuery: event.searchtext));
//   }
// }
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/data/initialrecipes.dart';

part 'add_recipe_event.dart';
part 'add_recipe_state.dart';

class AddRecipeBloc extends Bloc<AddRecipeEvent, AddRecipeState> {
  AddRecipeBloc() : super(AddRecipeState(recipes: initialRecipes)) {
    on<AddRecipePressed>(addrecipe);

    on<ToggleFavoritePressed>(favoriterecipe);

    on<ChangeCategory>(changeCategory);

    on<UpdateSearchQuery>(onUpdateSearch);
  }

  FutureOr<void> onUpdateSearch(
    UpdateSearchQuery event,
    Emitter<AddRecipeState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.searchtext));
  }

  FutureOr<void> changeCategory(
    ChangeCategory event,
    Emitter<AddRecipeState> emit,
  ) {
    emit(state.copyWith(selectedCategory: event.category));
  }

  FutureOr<void> favoriterecipe(
    ToggleFavoritePressed event,
    Emitter<AddRecipeState> emit,
  ) {
    final updated = List<Recipe>.from(state.recipes);
    updated[event.index].isFavorite = !updated[event.index].isFavorite;
    emit(state.copyWith(recipes: updated));
  }

  FutureOr<void> addrecipe(
    AddRecipePressed event,
    Emitter<AddRecipeState> emit,
  ) {
    final updated = List<Recipe>.from(state.recipes)..add(
      Recipe(
        personname: event.personname,
        imageavtar: event.image,
        image: event.image,
        title: event.title,
        description: event.description,
        duration: event.duration,
      ),
    );
    emit(state.copyWith(recipes: updated));
  }
}
