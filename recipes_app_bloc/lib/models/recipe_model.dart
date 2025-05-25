class RecipeModel {
  final String? profileImage;
  final String? name;
  final String imagePath;
  final String title;
  final String description;
  final bool isLiked;
  final bool isUploaded;

  RecipeModel({
    this.name,
    this.profileImage,
    required this.imagePath,
    required this.title,
    required this.description,
    this.isLiked = false,
       this.isUploaded = false,
  });
  

  RecipeModel copyWith({bool? isLiked}) {
    return RecipeModel(
      name: name,
      profileImage: profileImage,
      imagePath: imagePath,
      title: title,
      description: description,
      isLiked: isLiked ?? this.isLiked,
            isUploaded: isUploaded,
    );
  }

  // ✅ Add this to support equality comparison in BLoC
  @override
  bool operator ==(Object other) {
    return other is RecipeModel &&
        other.title == title &&
        other.description == description &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ imagePath.hashCode;
}

