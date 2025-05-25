class FoodItem {
  final String image;
  final String title;
  final String? avatar;
  final String? user;
  final bool isSelected;
  final bool isLiked;

  FoodItem({
    required this.image,
    required this.title,
    this.avatar,
    this.user,
    this.isSelected = false,
    this.isLiked = false,
  });

  FoodItem copyWith({
    String? image,
    String? title,
    String? avatar,
    String? user,
    bool? isSelected,
    bool? isLiked,
  }) {
    return FoodItem(
      image: image ?? this.image,
      title: title ?? this.title,
      avatar: avatar ?? this.avatar,
      user: user ?? this.user,
      isSelected: isSelected ?? this.isSelected,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
