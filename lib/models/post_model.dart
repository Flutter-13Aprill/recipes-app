import 'dart:math';

class PostModel {
  PostModel({required this.authorName, required this.recipeName, required this.recipeDuration, required this.recipeCategory, required this.authorImage, required this.recipeImage});
  final id = Random().nextInt(9999);
  final String authorName;
  final String recipeName;
  final String recipeDuration;
  final String recipeCategory;
  bool isLikePost = false;
  final String authorImage;
  final String recipeImage;
}