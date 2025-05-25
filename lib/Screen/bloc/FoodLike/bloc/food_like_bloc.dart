import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipes_app/Models/Food_Model.dart';
import 'package:flutter_recipes_app/Screen/bloc/FoodLike/bloc/food_like_event.dart';
import 'package:flutter_recipes_app/Screen/bloc/FoodLike/bloc/food_like_state.dart';

class FoodLikeBloc extends Bloc<FoodLikeEvent, FoodLikeState> {
  FoodLikeBloc(List<FoodItem> initialFoodItems)
      : super(FoodLikeState(foodItems: initialFoodItems)) {
    on<ToggleLikeEvent>((event, emit) {
      final updatedList = List<FoodItem>.from(state.foodItems);
      final item = updatedList[event.index];
      updatedList[event.index] = item.copyWith(isSelected: !item.isSelected);
      emit(state.copyWith(foodItems: updatedList));
    });

    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(selectedTabIndex: event.tabIndex));
    });
  }
}
