/// RecipeData: Model for recipe info (name, chef, prep time, images).
///
/// dummyRecipes: Sample list of recipes for testing.
class RecipeData {
  final String recipeName;
  final String chefName;
  final String preparationTime;
  final String imageUrl;
  final String chefAvatarUrl;

  RecipeData({
    required this.recipeName,
    required this.chefName,
    required this.preparationTime,
    required this.imageUrl,
    required this.chefAvatarUrl,
  });
}

List<RecipeData> dummyRecipes = [
  RecipeData(
    chefName: "Callum Lewis",
    recipeName: "Pancake",
    preparationTime: "Food >60 mins",
    imageUrl: 'assets/images/Pancake.png',
    chefAvatarUrl: 'assets/images/CalumLewis.png',
  ),
  RecipeData(
    chefName: "Elif Sones",
    recipeName: "Salad",
    preparationTime: "Food >60 mins",
    imageUrl: 'assets/images/Salad.png',
    chefAvatarUrl: 'assets/images/EilifSonas.png',
  ),
  RecipeData(
    chefName: "Elena Shelby",
    recipeName: "Pancake",
    preparationTime: "Food >60 mins",
    imageUrl: 'assets/images/Pancake2.png',
    chefAvatarUrl: 'assets/images/ElenaShelby.png',
  ),
  RecipeData(
    chefName: "John Priyadi",
    recipeName: "Pancake",
    preparationTime: "Food >60 mins",
    imageUrl: 'assets/images/Salad2.png',
    chefAvatarUrl: 'assets/images/JohnPriyadi.png',
  ),
];
