import 'package:flutter_bloc/flutter_bloc.dart';
import 'upload_event.dart';
import 'upload_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final List<Map<String, dynamic>> _recipes = [];

  RecipeBloc() : super(RecipeInitial()) {
    on<AddRecipeEvent>((event, emit) {
      _recipes.add({
        'id': event.id,
        'name': event.name,
        'description': event.description,
        'duration': event.duration,
        'image': event.image,
        'liked': false,
      });
      emit(RecipeLoadSuccessState(List.from(_recipes)));
    });

    on<ToggleLikeRecipeEvent>((event, emit) {
      for (var recipe in _recipes) {
        if (recipe['id'] == event.id) {
          recipe['liked'] = !(recipe['liked'] as bool);
          break;
        }
      }
      emit(RecipeLoadSuccessState(List.from(_recipes)));
    });

    on<ShowAllRecipesEvent>((event, emit) {
      emit(RecipeLoadSuccessState(List.from(_recipes)));
    });

    on<ShowLikedRecipesEvent>((event, emit) {
      final liked = _recipes.where((r) => r['liked'] == true).toList();
      emit(RecipeLoadSuccessState(liked));
    });
  }
}
