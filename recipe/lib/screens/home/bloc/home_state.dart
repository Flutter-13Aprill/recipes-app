import 'package:recipe/model/recipe.dart';

class HomeState {
  final List<Recipe> recipes;
  final String selectedCategory;
  final String selectedTab;

  HomeState({
    this.recipes = const [],
    this.selectedCategory = "All",
    this.selectedTab = "Left",
  });

  HomeState copyWith({
    List<Recipe>? recipes,
    String? selectedCategory,
    String? selectedTab,
  }) {
    return HomeState(
      recipes: recipes ?? this.recipes,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
