part of 'add_recipe_bloc.dart';

final class AddRecipeState {
  final List<Recipe> recipes;
  final String selectedCategory;
  final String searchQuery;

  AddRecipeState({
    required this.recipes,
    this.selectedCategory = "All",
    this.searchQuery = "",
  });

  List<Recipe> get filteredRecipes {
    return recipes.where((r) {
      final matchesCategory =
          selectedCategory == "All" || r.description == selectedCategory;
      final matchesSearch = r.title.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      return matchesCategory && matchesSearch;
    }).toList();
  }

  AddRecipeState copyWith({
    List<Recipe>? recipes,
    String? selectedCategory,
    String? searchQuery,
  }) {
    return AddRecipeState(
      recipes: recipes ?? this.recipes,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
