class Recipe {
  final String id; // Unique identifier for the recipe.
  final String name;// Name of the recipe creator or user.
  final String title;// Title of the recipe.
  final String profileImagePath;// Path to the profile image of the recipe creator.
  final String recipeImage;// Path to the image of the recipe itself.
  bool isFavorite; // A boolean flag indicating if the recipe is marked as favorite.

  // Constructor for the Recipe class.
  Recipe({
    required this.id,
   required   this.name,
    required this.title,
    required this.profileImagePath,
    required this.recipeImage,
    this.isFavorite = false,
  });

  // copyWith method to create a new Recipe instance with updated values.
   Recipe copyWith({bool? isFavorite}) {
    // Retain the current values except isFavorite
    return Recipe(
      id: id,
      name: name,
      title: title,
      profileImagePath: profileImagePath,
      recipeImage: recipeImage,
      isFavorite: isFavorite ?? this.isFavorite, // Update isFavorite if provided, otherwise retain current.
    );
  }
}