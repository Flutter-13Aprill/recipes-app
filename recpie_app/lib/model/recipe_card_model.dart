class RecipeCardData {
  final String userName;
  final String userImage;
  final String mainImage;
  final String title;
  final String subtitle;
  final bool isFavorite;

  RecipeCardData({
    required this.userName,
    required this.userImage,
    required this.mainImage,
    required this.title,
    required this.subtitle,
    required this.isFavorite,
  });
}

final List<RecipeCardData> cardsData = [
  RecipeCardData(
    userName: 'Calum Lewis',
    userImage: 'assets/images/pic.png',
    mainImage: 'assets/images/pic1.png',
    title: 'Pancake',
    subtitle: 'Food • >60 mins',
    isFavorite: false,
  ),
  RecipeCardData(
    userName: 'Eilif Sonas',
    userImage: 'assets/images/pic.png',
    mainImage: 'assets/images/pic2.png',
    title: 'Strawberry Cake',
    subtitle: 'Food • 30 mins',
    isFavorite: true,
  ),
  RecipeCardData(
    userName: 'John Doe',
    userImage: 'assets/images/pic.png',
    mainImage: 'assets/images/pic3.png',
    title: 'Orange Juice',
    subtitle: 'Drink • 10 mins',
    isFavorite: false,
  ),
];
