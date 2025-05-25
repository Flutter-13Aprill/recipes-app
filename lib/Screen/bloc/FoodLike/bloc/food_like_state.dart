import 'package:flutter_recipes_app/Models/Food_Model.dart';

class FoodLikeState {
  final List<FoodItem> foodItems;
  final int selectedTabIndex;

  FoodLikeState({
    required this.foodItems,
    this.selectedTabIndex = 0,
  });

  FoodLikeState copyWith({
    List<FoodItem>? foodItems,
    int? selectedTabIndex,
  }) {
    return FoodLikeState(
      foodItems: foodItems ?? this.foodItems,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
    );
  }
}
