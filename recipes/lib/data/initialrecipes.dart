// import 'package:recipes/bloc/add_recipe_bloc.dart';

class Recipe {
  final String personname;
  final dynamic imageavtar;
  final dynamic image;
  final String title;
  final String description;
  final int duration;
  bool isFavorite;

  Recipe({
    required this.personname,
    required this.imageavtar,
    required this.image,
    required this.title,
    required this.description,
    required this.duration,
    this.isFavorite = false,
  });
}

final List<Recipe> initialRecipes = [
  Recipe(
    imageavtar: "images/p1.png",
    personname: "Calum Lewis",
    image: 'images/pan.png',
    title: 'Pancake',
    description: 'Food',
    duration: 30,
  ),
  Recipe(
    imageavtar: "images/p2.png",
    personname: "Eilif Sonas",
    image: 'images/sala.png',
    title: 'Salad',
    description: 'Food',
    duration: 20,
  ),
  Recipe(
    imageavtar: "images/p3.png",
    personname: "Elena Shelby",
    image: 'images/fru.png',
    title: 'Fresh Juice',
    description: 'Drink',
    duration: 10,
  ),
  Recipe(
    imageavtar: "images/p4.png",
    personname: "John Priyadi",
    image: 'images/pic4.png',
    title: 'Fresh Juice',
    description: 'Drink',
    duration: 10,
  ),
];
