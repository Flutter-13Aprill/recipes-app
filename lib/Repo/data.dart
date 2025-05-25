import 'package:blocrecipes/Models/recipe.dart';

List<Recipe> liked = [];
List<Recipe> uploaded = [
  Recipe(
    foodName: "Pancake",
    profileImagePath: 'assets/images/profile1.png',
    userName: 'Calum Lewis',

    foodImagePath: 'assets/images/recipe1.png',
    duration: '>60 mins',
  ),
];
List<Recipe> recipes = [
  Recipe(
    foodName: "Pancake",
    profileImagePath: 'assets/images/profile1.png',
    userName: 'Calum Lewis',

    foodImagePath: 'assets/images/recipe1.png',
    duration: '>60 mins',
  ),
  Recipe(
    foodName: "Salad",
    profileImagePath: 'assets/images/profile2.png',
    userName: 'Emma Johnson',
    foodImagePath: 'assets/images/recipe2.png',
    duration: '30 mins',
  ),
  Recipe(
    foodName: "Oatmeal",
    profileImagePath: 'assets/images/profile3.png',
    userName: 'Liam Smith',
    foodImagePath: 'assets/images/recipe3.png',
    duration: '45 mins',
  ),
  Recipe(
    foodName: "fruit Salad",
    profileImagePath: 'assets/images/profile4.png',
    userName: 'Olivia Brown',
    foodImagePath: 'assets/images/recipe4.png',
    duration: '20 mins',
  ),
  ...uploaded,
];
