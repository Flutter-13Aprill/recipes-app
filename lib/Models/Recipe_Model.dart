class Recipe {
  final String title;
  final String imagePath;
  bool isLiked;

  Recipe({
    required this.title,
    required this.imagePath,
    this.isLiked = false,
  });
}
