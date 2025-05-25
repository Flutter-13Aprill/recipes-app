// Model class representing recipe information, including details like name, description, image, preparation time, favorite status, ownership, and user profile info.

class RecipesInfoModel {
  final String name;
  final String desc;
  final String imagePath;
  final double minutes;
  bool isFavorite;
  final bool isMine;
  final String avatarPath;
  final String username;

  RecipesInfoModel({
    required this.name,
    required this.desc,
    required this.imagePath,
    required this.minutes,
    this.isFavorite = false,
    this.isMine = true,
    this.avatarPath = "assets/images/profile.png",
    this.username = "Choirul Syafril",
  });
}
