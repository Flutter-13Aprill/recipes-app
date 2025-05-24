class Recipe {
  final String id;
  final String title;
  final String image;
  final String author;
  final String authorImage;
  final String category;
  final String duration;

  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.author,
    required this.authorImage,
    required this.category,
    required this.duration,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Recipe && id == other.id);

  @override
  int get hashCode => id.hashCode;
}
