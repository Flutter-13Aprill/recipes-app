import 'dart:io';

class RecipeModel {
  RecipeModel({required this.name,  required this.duration, required this.category, required this.imagePath});

  File imagePath;
  final String name;
  bool isLikePost = false;
  final String duration;
  final String category;
}